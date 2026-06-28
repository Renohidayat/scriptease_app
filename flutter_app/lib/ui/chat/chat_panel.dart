import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/ai_chat/ai_chat_bloc.dart';
import '../../bloc/ai_chat/ai_chat_event.dart';
import '../../bloc/ai_chat/ai_chat_state.dart';

class ChatPanel extends StatefulWidget {
  const ChatPanel({super.key});

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // TODO: get real document context from EditorBloc state
    final documentContent = "Sample context from editor..."; 
    
    context.read<AiChatBloc>().add(AiChatEvent.sendMessage(text, documentContent));
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8.0),
                const Text('AI Assistant', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          // Messages List
          Expanded(
            child: BlocBuilder<AiChatBloc, AiChatState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.messages.length + (state.isStreaming ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.messages.length) {
                      // Streaming message
                      return _buildMessageBubble(
                        'assistant', 
                        state.currentStreamedText ?? '...',
                        isStreaming: true,
                      );
                    }
                    
                    final msg = state.messages[index];
                    return _buildMessageBubble(msg.role, msg.content);
                  },
                );
              },
            ),
          ),
          
          // Input Area
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Tanyakan sesuatu ke AI...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8.0),
                BlocBuilder<AiChatBloc, AiChatState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(Icons.send),
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: state.isStreaming ? null : _sendMessage,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String role, String content, {bool isStreaming = false}) {
    final isUser = role == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(12.0),
        constraints: const BoxConstraints(maxWidth: 350),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade100 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUser ? 'You' : 'AI Assistant',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: isUser ? Colors.blue.shade800 : Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(content),
            if (isStreaming)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
