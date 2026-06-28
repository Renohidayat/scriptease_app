// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_dao.dart';

// ignore_for_file: type=lint
mixin _$ChatHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $DocumentsTable get documents => attachedDatabase.documents;
  $ChatHistoryEntriesTable get chatHistoryEntries =>
      attachedDatabase.chatHistoryEntries;
  ChatHistoryDaoManager get managers => ChatHistoryDaoManager(this);
}

class ChatHistoryDaoManager {
  final _$ChatHistoryDaoMixin _db;
  ChatHistoryDaoManager(this._db);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db.attachedDatabase, _db.documents);
  $$ChatHistoryEntriesTableTableManager get chatHistoryEntries =>
      $$ChatHistoryEntriesTableTableManager(
        _db.attachedDatabase,
        _db.chatHistoryEntries,
      );
}
