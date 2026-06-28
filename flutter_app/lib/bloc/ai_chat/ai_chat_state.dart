import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_state.freezed.dart';

@freezed
abstract class AiChatState with _$AiChatState {
  const AiChatState._();

  const factory AiChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isStreaming,
    String? currentStreamedText,
    String? errorMessage,
  }) = _AiChatState;
}

// Simple domain model for chat
class ChatMessage {
  final String role; // 'user' or 'assistant'
  final String content;

  ChatMessage({required this.role, required this.content});
}
