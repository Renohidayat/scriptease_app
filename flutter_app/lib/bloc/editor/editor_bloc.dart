import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../core/database/dao/documents_dao.dart';
import 'editor_event.dart';
import 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final DocumentsDao _documentsDao;
  Timer? _debounceTimer;

  EditorBloc(this._documentsDao) : super(const EditorState.initial()) {
    on<EditorEvent>((event, emit) async {
      await event.map(
        loadDocument: (e) => _onLoadDocument(e, emit),
        saveDocument: (e) => _onSaveDocument(e, emit),
        contentChanged: (e) => _onContentChanged(e, emit),
      );
    });
  }

  Future<void> _onLoadDocument(
      dynamic event, Emitter<EditorState> emit) async {
    emit(const EditorState.loading());
    try {
      final docId = event.documentId;
      final dbDoc = await _documentsDao.getDocumentById(docId);
      
      if (dbDoc == null) {
        emit(const EditorState.error('Document not found.'));
        return;
      }

      quill.Document quillDoc;
      if (dbDoc.contentDelta.isNotEmpty && dbDoc.contentDelta != '[]') {
        quillDoc = quill.Document.fromJson(jsonDecode(dbDoc.contentDelta));
      } else {
        quillDoc = quill.Document();
      }

      final controller = quill.QuillController(
        document: quillDoc,
        selection: const TextSelection.collapsed(offset: 0),
      );

      // Listen to changes for auto-save
      controller.document.changes.listen((_) {
        add(const EditorEvent.contentChanged());
      });

      emit(EditorState.loaded(dbDocument: dbDoc, quillController: controller));
    } catch (e) {
      emit(EditorState.error('Failed to load document: $e'));
    }
  }

  Future<void> _onContentChanged(
      dynamic event, Emitter<EditorState> emit) async {
    // Debounce save to prevent spamming SQLite
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 2), () {
      add(const EditorEvent.saveDocument());
    });
  }

  Future<void> _onSaveDocument(
      dynamic event, Emitter<EditorState> emit) async {
    // Access state directly
    final currentState = state;
    if (currentState.mapOrNull(loaded: (s) => s) == null) return;
    
    final loadedState = currentState.mapOrNull(loaded: (s) => s)!;
    
    emit(loadedState.copyWith(isSaving: true));
    try {
      final deltaJson = jsonEncode(loadedState.quillController.document.toDelta().toJson());
      final plainText = loadedState.quillController.document.toPlainText();
      final wordCount = plainText.trim().split(RegExp(r'\s+')).length;

      await _documentsDao.updateDocumentContent(
        loadedState.dbDocument.id,
        deltaJson,
        plainText,
        wordCount,
      );
      
      emit(loadedState.copyWith(isSaving: false));
    } catch (e) {
      emit(loadedState.copyWith(isSaving: false));
      // Optionally handle save error
    }
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    final currentState = state;
    if (currentState.mapOrNull(loaded: (s) => s) != null) {
      currentState.mapOrNull(loaded: (s) => s)!.quillController.dispose();
    }
    return super.close();
  }
}
