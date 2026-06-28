import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'ai_chat_event.dart';
import 'ai_chat_state.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final Dio _dio;

  AiChatBloc(this._dio) : super(const AiChatState()) {
    on<AiChatEvent>((event, emit) async {
      await event.map(
        sendMessage: (e) => _onSendMessage(e, emit),
        streamChunkReceived: (e) => _onStreamChunkReceived(e, emit),
        streamCompleted: (e) => _onStreamCompleted(e, emit),
        streamError: (e) => _onStreamError(e, emit),
      );
    });
  }

  Future<void> _onSendMessage(dynamic event, Emitter<AiChatState> emit) async {
    final userMsg = ChatMessage(role: 'user', content: event.text);
    emit(state.copyWith(
      messages: [...state.messages, userMsg],
      isStreaming: true,
      currentStreamedText: '',
      errorMessage: null,
    ));

    try {
      final response = await _dio.post(
        'http://127.0.0.1:8765/api/v1/llm/stream',
        data: {
          "messages": [], // We can send past history here if needed
          "user_prompt": event.text,
          "api_key": "YOUR_API_KEY", // Will be pulled from SettingsDao later
          "document_context": {
            "document_title": "Active Document",
            "current_chapter": "BAB I",
            "word_count": 0,
            "citation_style": "APA"
          }
        },
        options: Options(
          responseType: ResponseType.stream,
        ),
      );

      final stream = response.data.stream as Stream<List<int>>;
      final transformer = StreamTransformer<List<int>, String>.fromHandlers(
        handleData: (data, sink) {
          final lines = utf8.decode(data).split('\n');
          for (final line in lines) {
            if (line.startsWith('data: ')) {
              final jsonStr = line.substring(6).trim();
              if (jsonStr.isEmpty) continue;
              
              try {
                final json = jsonDecode(jsonStr);
                if (json['error'] != null) {
                  sink.addError(json['error']);
                } else if (json['done'] == false) {
                  sink.add(json['chunk'] ?? '');
                }
              } catch (e) {
                // Ignore parse errors on partial chunks if any
              }
            }
          }
        },
      );

      await for (final chunk in stream.transform(transformer)) {
        add(AiChatEvent.streamChunkReceived(chunk));
      }
      
      add(const AiChatEvent.streamCompleted());

    } catch (e) {
      add(AiChatEvent.streamError(e.toString()));
    }
  }

  Future<void> _onStreamChunkReceived(dynamic event, Emitter<AiChatState> emit) async {
    if (!state.isStreaming) return;
    final newText = (state.currentStreamedText ?? '') + event.chunk;
    emit(state.copyWith(currentStreamedText: newText));
  }

  Future<void> _onStreamCompleted(dynamic event, Emitter<AiChatState> emit) async {
    if (!state.isStreaming) return;
    final botMsg = ChatMessage(role: 'assistant', content: state.currentStreamedText ?? '');
    emit(state.copyWith(
      messages: [...state.messages, botMsg],
      isStreaming: false,
      currentStreamedText: null,
    ));
  }

  Future<void> _onStreamError(dynamic event, Emitter<AiChatState> emit) async {
    emit(state.copyWith(
      isStreaming: false,
      errorMessage: event.error,
    ));
  }
}
