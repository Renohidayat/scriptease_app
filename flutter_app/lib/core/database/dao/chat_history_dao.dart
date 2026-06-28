import 'package:drift/drift.dart';
import '../app_database.dart';

part 'chat_history_dao.g.dart';

@DriftAccessor(tables: [ChatHistoryEntries])
class ChatHistoryDao extends DatabaseAccessor<AppDatabase> with _$ChatHistoryDaoMixin {
  ChatHistoryDao(AppDatabase db) : super(db);
}
