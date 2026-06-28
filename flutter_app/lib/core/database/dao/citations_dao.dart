import 'package:drift/drift.dart';
import '../app_database.dart';

part 'citations_dao.g.dart';

@DriftAccessor(tables: [CitationCache, DocumentCitations])
class CitationsDao extends DatabaseAccessor<AppDatabase> with _$CitationsDaoMixin {
  CitationsDao(AppDatabase db) : super(db);
}
