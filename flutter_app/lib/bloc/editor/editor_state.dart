import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/database/app_database.dart' as db;

part 'editor_state.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.initial() = _Initial;
  const factory EditorState.loading() = _Loading;
  const factory EditorState.loaded({
    required db.Document dbDocument,
    required quill.QuillController quillController,
    @Default(false) bool isSaving,
  }) = _Loaded;
  const factory EditorState.error(String message) = _Error;
}
