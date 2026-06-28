import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_event.freezed.dart';

@freezed
class AiChatEvent with _$AiChatEvent {
  const factory AiChatEvent.sendMessage(String text, String documentContent) = _SendMessage;
  const factory AiChatEvent.streamChunkReceived(String chunk) = _StreamChunkReceived;
  const factory AiChatEvent.streamCompleted() = _StreamCompleted;
  const factory AiChatEvent.streamError(String error) = _StreamError;
}
