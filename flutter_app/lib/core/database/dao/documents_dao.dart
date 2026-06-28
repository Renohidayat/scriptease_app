import 'package:drift/drift.dart';
import '../app_database.dart';

part 'documents_dao.g.dart';

@DriftAccessor(tables: [Documents])
class DocumentsDao extends DatabaseAccessor<AppDatabase> with _$DocumentsDaoMixin {
  DocumentsDao(AppDatabase db) : super(db);

  /// Get a stream of all documents, ordered by recently updated
  Stream<List<Document>> watchAllDocuments() {
    return (select(documents)
          ..where((d) => d.isDeleted.equals(false))
          ..orderBy([
            (d) => OrderingTerm(expression: d.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  /// Get a single document by ID
  Future<Document?> getDocumentById(int id) {
    return (select(documents)..where((d) => d.id.equals(id))).getSingleOrNull();
  }

  /// Create a new document and return its ID
  Future<int> createDocument(DocumentsCompanion entry) {
    return into(documents).insert(entry);
  }

  /// Update an existing document
  Future<bool> updateDocument(DocumentsCompanion entry) {
    return update(documents).replace(entry);
  }

  /// Soft delete a document
  Future<int> deleteDocument(int id) {
    return (update(documents)..where((d) => d.id.equals(id)))
        .write(const DocumentsCompanion(
      isDeleted: Value(true),
      // Automatically update the updatedAt timestamp
    ));
  }

  /// Update just the content delta and word count
  Future<int> updateDocumentContent(int id, String deltaJson, String plainText, int wordCount) {
    return (update(documents)..where((d) => d.id.equals(id)))
        .write(DocumentsCompanion(
      contentDelta: Value(deltaJson),
      contentPlainText: Value(plainText),
      wordCount: Value(wordCount),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// Update last opened timestamp
  Future<int> markAsOpened(int id) {
    return (update(documents)..where((d) => d.id.equals(id)))
        .write(DocumentsCompanion(
      lastOpenedAt: Value(DateTime.now()),
    ));
  }
}
