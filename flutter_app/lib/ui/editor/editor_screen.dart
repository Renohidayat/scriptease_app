import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' hide EditorState;
import 'package:split_view/split_view.dart';
import '../../bloc/editor/editor_bloc.dart';
import '../../bloc/editor/editor_state.dart';
import '../chat/chat_panel.dart';
import 'embeds/citation_embed_builder.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScriptEase Editor'),
        actions: [
          BlocBuilder<EditorBloc, EditorState>(
            builder: (context, state) {
              return state.maybeMap(
                loaded: (s) => Row(
                  children: [
                    if (s.isExporting)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: 16, height: 16, 
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Text(
                          s.isSaving ? 'Saving...' : 'Saved',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.download),
                      tooltip: 'Export Document',
                      onSelected: (format) {
                        context.read<EditorBloc>().add(EditorEvent.exportDocument(format));
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'docx',
                          child: Text('Export to DOCX'),
                        ),
                        const PopupMenuItem(
                          value: 'pdf',
                          child: Text('Export to PDF'),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<EditorBloc, EditorState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: Text('Initialize to start')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (e) => Center(child: Text('Error: ${e.message}')),
            loaded: (loadedState) => SplitView(
              viewMode: SplitViewMode.Horizontal,
              indicator: const SplitIndicator(viewMode: SplitViewMode.Horizontal),
              activeIndicator: const SplitIndicator(
                viewMode: SplitViewMode.Horizontal,
                isActive: true,
              ),
              controller: SplitViewController(weights: [0.7, 0.3]),
              children: [
                _buildEditorPane(context, loadedState.quillController),
                const ChatPanel(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditorPane(BuildContext context, QuillController controller) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          QuillSimpleToolbar(
            controller: controller,
            configurations: const QuillSimpleToolbarConfigurations(
              multiRowsDisplay: false,
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuillEditor.basic(
                controller: controller,
                configurations: QuillEditorConfigurations(
                  padding: const EdgeInsets.all(16),
                  embedBuilders: [
                    CitationEmbedBuilder(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
