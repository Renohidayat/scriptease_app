// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citations_dao.dart';

// ignore_for_file: type=lint
mixin _$CitationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CitationCacheTable get citationCache => attachedDatabase.citationCache;
  $DocumentsTable get documents => attachedDatabase.documents;
  $DocumentCitationsTable get documentCitations =>
      attachedDatabase.documentCitations;
  CitationsDaoManager get managers => CitationsDaoManager(this);
}

class CitationsDaoManager {
  final _$CitationsDaoMixin _db;
  CitationsDaoManager(this._db);
  $$CitationCacheTableTableManager get citationCache =>
      $$CitationCacheTableTableManager(_db.attachedDatabase, _db.citationCache);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db.attachedDatabase, _db.documents);
  $$DocumentCitationsTableTableManager get documentCitations =>
      $$DocumentCitationsTableTableManager(
        _db.attachedDatabase,
        _db.documentCitations,
      );
}
