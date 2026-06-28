// ═══════════════════════════════════════════════════════════════════
// app_database.dart — AntiGravity WP Local SQLite Database
// Uses Drift for type-safe, reactive SQLite access
// ═══════════════════════════════════════════════════════════════════

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dao/documents_dao.dart';
import 'dao/chat_history_dao.dart';
import 'dao/citations_dao.dart';
import 'dao/settings_dao.dart';

part 'app_database.g.dart';

// ── TABLE DEFINITIONS ────────────────────────────────────────────

/// Stores user's academic documents
class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 500)();
  TextColumn get filePath => text().nullable()();
  TextColumn get contentDelta => text().withDefault(const Constant('[]'))();
  TextColumn get contentPlainText => text().withDefault(const Constant(''))();
  IntColumn get wordCount => integer().withDefault(const Constant(0))();
  TextColumn get citationStyle =>
      text().withDefault(const Constant('APA'))(); // APA|IEEE|Chicago|Indonesia
  TextColumn get academicFormat =>
      text().withDefault(const Constant('SKRIPSI'))(); // SKRIPSI|TESIS|PAPER
  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastOpenedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// AI chat messages per document session
class ChatHistoryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get documentId =>
      integer().references(Documents, #id, onDelete: KeyAction.cascade)();
  TextColumn get sessionId => text()();
  TextColumn get role => text()(); // user | assistant | system
  TextColumn get content => text()();
  IntColumn get tokenCountInput =>
      integer().withDefault(const Constant(0))();
  IntColumn get tokenCountOutput =>
      integer().withDefault(const Constant(0))();
  TextColumn get llmProvider => text().nullable()(); // openai|gemini|anthropic
  TextColumn get llmModel => text().nullable()();
  IntColumn get latencyMs => integer().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Reusable prompt templates (system + user)
class PromptTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get category =>
      text()(); // writing|citation|format|analysis|revision
  TextColumn get templateText => text()();
  TextColumn get variablesJson =>
      text().withDefault(const Constant('[]'))(); // ["title","chapter",...]
  IntColumn get usageCount => integer().withDefault(const Constant(0))();
  BoolColumn get isSystem =>
      boolean().withDefault(const Constant(false))(); // built-in vs user
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Cache of citations from Zotero/Mendeley to avoid repeated DB reads
class CitationCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()(); // zotero | mendeley | manual
  TextColumn get externalId => text()();
  TextColumn get citeKey => text().unique()();
  TextColumn get title => text()();
  TextColumn get authorsJson => text()(); // JSON array of author strings
  IntColumn get year => integer().nullable()();
  TextColumn get journal => text().nullable()();
  TextColumn get volume => text().nullable()();
  TextColumn get issue => text().nullable()();
  TextColumn get pages => text().nullable()();
  TextColumn get doi => text().nullable()();
  TextColumn get url => text().nullable()();
  // Pre-formatted citation strings for each style
  TextColumn get apaFormatted => text().nullable()();
  TextColumn get ieeeFormatted => text().nullable()();
  TextColumn get chicagoFormatted => text().nullable()();
  TextColumn get indonesiaFormatted => text().nullable()();
  TextColumn get rawJson => text()(); // Full source data as JSON
  DateTimeColumn get lastSyncedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Metadata for PDFs indexed into ChromaDB for RAG
class RagIndexMetadata extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get filePath => text()();
  TextColumn get fileName => text()();
  TextColumn get fileHash => text()(); // SHA-256 for dedup
  IntColumn get fileSizeBytes => integer()();
  IntColumn get pageCount => integer().nullable()();
  IntColumn get chunkCount => integer().nullable()();
  TextColumn get collectionName =>
      text().withDefault(const Constant('references'))();
  TextColumn get indexStatus =>
      text().withDefault(const Constant('pending'))(); // pending|processing|completed|failed
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get indexedAt => dateTime().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// App settings as key-value store
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  TextColumn get valueType =>
      text().withDefault(const Constant('string'))(); // string|int|bool|json
  TextColumn get description => text().nullable()();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {key};
}

/// Junction: which citations are used in which documents
class DocumentCitations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get documentId =>
      integer().references(Documents, #id, onDelete: KeyAction.cascade)();
  IntColumn get citationId =>
      integer().references(CitationCache, #id, onDelete: KeyAction.cascade)();
  IntColumn get positionIndex =>
      integer().withDefault(const Constant(0))(); // order in bibliography
  IntColumn get inlineCount =>
      integer().withDefault(const Constant(1))(); // times cited in text
  DateTimeColumn get insertedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {documentId, citationId}
      ];
}

// ── DATABASE CLASS ───────────────────────────────────────────────

@DriftDatabase(
  tables: [
    Documents,
    ChatHistoryEntries,
    PromptTemplates,
    CitationCache,
    RagIndexMetadata,
    AppSettings,
    DocumentCitations,
  ],
  daos: [
    DocumentsDao,
    ChatHistoryDao,
    CitationsDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultData();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations handled here
        },
      );

  /// Seed default prompt templates on first run
  Future<void> _seedDefaultData() async {
    final templates = [
      PromptTemplatesCompanion.insert(
        name: 'Tulis Pendahuluan Bab',
        category: 'writing',
        templateText:
            'Tulis pendahuluan untuk {{chapter_name}} skripsi saya berjudul "{{document_title}}". '
            'Latar belakang masalah, rumusan masalah, tujuan, dan manfaat penelitian. '
            'Gunakan bahasa Indonesia akademik yang formal. Panjang sekitar {{word_count}} kata.',
        variablesJson: const Value('["chapter_name","document_title","word_count"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Cari & Masukkan Sitasi',
        category: 'citation',
        templateText:
            'Cari referensi dari {{author}} tahun {{year}} di library saya '
            'dan masukkan inline citation dengan format {{citation_style}}.',
        variablesJson: const Value('["author","year","citation_style"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Format Daftar Pustaka',
        category: 'format',
        templateText:
            'Format ulang semua daftar pustaka yang ada di dokumen ini '
            'sesuai dengan standar {{citation_style}}. '
            'Urutkan secara alfabetis berdasarkan nama belakang penulis pertama.',
        variablesJson: const Value('["citation_style"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Review & Perbaiki Tata Bahasa',
        category: 'revision',
        templateText:
            'Review paragraf berikut dan perbaiki tata bahasa, ejaan, dan kejelasan '
            'sesuai dengan kaidah penulisan akademik Indonesia:\n\n{{selected_text}}',
        variablesJson: const Value('["selected_text"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Buat Abstrak',
        category: 'writing',
        templateText:
            'Buat abstrak dalam bahasa Indonesia dan Inggris untuk skripsi saya '
            'berdasarkan isi dokumen ini. Maksimal 250 kata per bahasa. '
            'Sertakan: tujuan, metode, hasil, dan kesimpulan.',
        variablesJson: const Value('[]'),
        isSystem: const Value(true),
      ),
    ];

    for (final t in templates) {
      await into(promptTemplates).insert(t);
    }

    // Default app settings
    final defaultSettings = {
      'llm_provider': ('openai', 'string', 'LLM provider: openai|gemini|anthropic'),
      'llm_model': ('gpt-4o', 'string', 'LLM model name'),
      'llm_temperature': ('0.7', 'string', 'LLM creativity (0.0-1.0)'),
      'default_citation_style': ('APA', 'string', 'Default: APA|IEEE|Chicago|Indonesia'),
      'theme_mode': ('system', 'string', 'Theme: light|dark|system'),
      'auto_save_interval_seconds': ('30', 'int', 'Auto-save interval in seconds'),
      'rag_enabled': ('true', 'bool', 'Enable RAG context in AI responses'),
      'python_service_port': ('8765', 'int', 'Local FastAPI service port'),
    };

    for (final entry in defaultSettings.entries) {
      await into(appSettings).insert(
        AppSettingsCompanion.insert(
          key: entry.key,
          value: entry.value.$1,
          valueType: Value(entry.value.$2),
          description: Value(entry.value.$3),
        ),
      );
    }
  }
}

/// Opens the SQLite connection in the app's documents directory
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'antigravity_wp', 'app.sqlite'));
    await file.parent.create(recursive: true);
    return NativeDatabase.createInBackground(file);
  });
}
