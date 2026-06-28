// ═══════════════════════════════════════════════════════════════════
// zotero_db_service.dart — Direct Zotero SQLite Reader
// Reads zotero.sqlite WITHOUT Zotero running (READ-ONLY)
// Uses sqflite_common_ffi for Windows desktop SQLite access
// ═══════════════════════════════════════════════════════════════════

import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:injectable/injectable.dart';
import '../models/citation.dart';

class ZoteroNotFoundException implements Exception {
  final String message;
  ZoteroNotFoundException(this.message);
  @override
  String toString() => 'ZoteroNotFoundException: $message';
}

class ZoteroAccessException implements Exception {
  final String message;
  ZoteroAccessException(this.message);
  @override
  String toString() => 'ZoteroAccessException: $message';
}

@singleton
class ZoteroDbService {
  Database? _db;
  String? _dbPath;

  /// Detect Zotero DB path from default Windows location or custom path
  Future<String> detectZoteroPath({String? customPath}) async {
    if (customPath != null && customPath.isNotEmpty) {
      if (await File(customPath).exists()) return customPath;
      throw ZoteroNotFoundException('Custom path tidak ditemukan: $customPath');
    }

    final userProfile = Platform.environment['USERPROFILE'] ??
        Platform.environment['HOMEPATH'] ??
        '';

    final candidates = [
      '$userProfile\\Zotero\\zotero.sqlite',
      '$userProfile\\Documents\\Zotero\\zotero.sqlite',
      '${Platform.environment['APPDATA']}\\Zotero\\Zotero\\zotero.sqlite',
    ];

    for (final candidate in candidates) {
      if (await File(candidate).exists()) {
        return candidate;
      }
    }

    throw ZoteroNotFoundException(
      'Zotero database tidak ditemukan di lokasi default.\n'
      'Pastikan Zotero terinstall, atau atur path manual di Settings.\n'
      'Path yang dicek:\n${candidates.join('\n')}',
    );
  }

  /// Open READ-ONLY connection to Zotero SQLite
  Future<void> connect({String? customPath}) async {
    sqfliteFfiInit();
    final factory = databaseFactoryFfi;

    _dbPath = await detectZoteroPath(customPath: customPath);

    try {
      // Open as READ-ONLY to never corrupt Zotero's database
      _db = await factory.openDatabase(
        _dbPath!,
        options: OpenDatabaseOptions(
          readOnly: true,
          singleInstance: false,
        ),
      );
    } catch (e) {
      throw ZoteroAccessException(
        'Gagal membuka zotero.sqlite: $e\n'
        'Pastikan Zotero tidak sedang mengunci file.',
      );
    }
  }

  Future<void> disconnect() async {
    await _db?.close();
    _db = null;
  }

  Future<bool> testConnection({String? customPath}) async {
    try {
      await connect(customPath: customPath);
      final result = await _db!.rawQuery('SELECT COUNT(*) as count FROM items');
      await disconnect();
      return (result.first['count'] as int) >= 0;
    } catch (_) {
      return false;
    }
  }

  /// Search citations by author name and/or year
  /// Query covers: creator lastName, title, year
  Future<List<Citation>> searchCitations(String query) async {
    if (_db == null) await connect();

    // Parse query: "Smith 2024" → author="Smith", year="2024"
    final parts = query.trim().split(RegExp(r'\s+'));
    String authorQuery = '';
    String yearQuery = '';
    String titleQuery = query;

    for (final part in parts) {
      if (RegExp(r'^\d{4}$').hasMatch(part)) {
        yearQuery = part;
      } else {
        authorQuery += '$part ';
      }
    }
    authorQuery = authorQuery.trim();

    const sql = '''
      SELECT
        items.key           AS cite_key,
        itemTypes.typeName  AS item_type,
        title_v.value       AS title,
        year_v.value        AS year,
        journal_v.value     AS journal,
        doi_v.value         AS doi,
        url_v.value         AS url,
        pages_v.value       AS pages,
        volume_v.value      AS volume,
        issue_v.value       AS issue,
        GROUP_CONCAT(
          CASE
            WHEN creators.firstName IS NOT NULL AND creators.firstName != ''
            THEN creators.lastName || ', ' || creators.firstName
            ELSE creators.lastName
          END,
          '; '
        ) AS authors
      FROM items
      JOIN itemTypes ON items.itemTypeID = itemTypes.itemTypeID
      -- Title (fieldID = 1 for most items)
      LEFT JOIN itemData     AS title_d  ON items.itemID = title_d.itemID  AND title_d.fieldID  = 1
      LEFT JOIN itemDataValues AS title_v ON title_d.valueID = title_v.valueID
      -- Year / Date (fieldID = 14)
      LEFT JOIN itemData     AS year_d   ON items.itemID = year_d.itemID   AND year_d.fieldID   = 14
      LEFT JOIN itemDataValues AS year_v  ON year_d.valueID = year_v.valueID
      -- Journal (fieldID = 12)
      LEFT JOIN itemData     AS journal_d ON items.itemID = journal_d.itemID AND journal_d.fieldID = 12
      LEFT JOIN itemDataValues AS journal_v ON journal_d.valueID = journal_v.valueID
      -- DOI (fieldID = 26)
      LEFT JOIN itemData     AS doi_d    ON items.itemID = doi_d.itemID    AND doi_d.fieldID    = 26
      LEFT JOIN itemDataValues AS doi_v   ON doi_d.valueID = doi_v.valueID
      -- URL (fieldID = 13)
      LEFT JOIN itemData     AS url_d    ON items.itemID = url_d.itemID    AND url_d.fieldID    = 13
      LEFT JOIN itemDataValues AS url_v   ON url_d.valueID = url_v.valueID
      -- Pages (fieldID = 10)
      LEFT JOIN itemData     AS pages_d  ON items.itemID = pages_d.itemID  AND pages_d.fieldID  = 10
      LEFT JOIN itemDataValues AS pages_v ON pages_d.valueID = pages_v.valueID
      -- Volume (fieldID = 28)
      LEFT JOIN itemData     AS volume_d ON items.itemID = volume_d.itemID AND volume_d.fieldID = 28
      LEFT JOIN itemDataValues AS volume_v ON volume_d.valueID = volume_v.valueID
      -- Issue/Number (fieldID = 29)
      LEFT JOIN itemData     AS issue_d  ON items.itemID = issue_d.itemID  AND issue_d.fieldID  = 29
      LEFT JOIN itemDataValues AS issue_v ON issue_d.valueID = issue_v.valueID
      -- Creators (Authors)
      LEFT JOIN itemCreators ON items.itemID = itemCreators.itemID AND itemCreators.creatorTypeID = 1
      LEFT JOIN creators     ON itemCreators.creatorID = creators.creatorID
      -- Exclude deleted items and attachments
      WHERE items.itemID NOT IN (SELECT itemID FROM deletedItems)
        AND items.itemTypeID NOT IN (1, 14) 
        AND (
          (? != '' AND creators.lastName LIKE '%' || ? || '%')
          OR (? != '' AND title_v.value LIKE '%' || ? || '%')
          OR title_v.value LIKE '%' || ? || '%'
        )
        AND (? = '' OR SUBSTR(year_v.value, 1, 4) = ?)
      GROUP BY items.itemID
      ORDER BY year_v.value DESC, creators.lastName ASC
      LIMIT 20
    ''';

    final rows = await _db!.rawQuery(sql, [
      authorQuery, authorQuery,    // author filter
      titleQuery, titleQuery,      // title filter
      titleQuery,                  // fallback title
      yearQuery, yearQuery,        // year filter
    ]);

    return rows.map(_rowToCitation).toList();
  }

  Citation _rowToCitation(Map<String, dynamic> row) {
    final authors = (row['authors'] as String? ?? '').split('; ')
        .where((a) => a.isNotEmpty)
        .toList();
    final year = row['year'] != null
        ? int.tryParse((row['year'] as String).substring(0, 4))
        : null;

    return Citation(
      citeKey: row['cite_key'] as String,
      title: row['title'] as String? ?? 'Untitled',
      authors: authors,
      year: year,
      journal: row['journal'] as String?,
      doi: row['doi'] as String?,
      url: row['url'] as String?,
      pages: row['pages'] as String?,
      volume: row['volume'] as String?,
      issue: row['issue'] as String?,
      source: CitationSource.zotero,
    );
  }
}
