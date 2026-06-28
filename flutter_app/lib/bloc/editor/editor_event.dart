import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_event.freezed.dart';

@freezed
class EditorEvent with _$EditorEvent {
  const factory EditorEvent.loadDocument(int documentId) = _LoadDocument;
  const factory EditorEvent.saveDocument() = _SaveDocument;
  const factory EditorEvent.contentChanged() = _ContentChanged;
}
