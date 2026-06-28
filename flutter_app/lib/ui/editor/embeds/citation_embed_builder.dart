import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'citation_embed.dart';

class CitationEmbedBuilder extends EmbedBuilder {
  @override
  String get key => CitationBlockEmbed.citationType;

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed node,
    bool readOnly,
    bool inline,
    TextStyle textStyle,
  ) {
    final dataStr = node.value.data as String;
    final Map<String, dynamic> data = jsonDecode(dataStr);
    final formattedText = data['formattedText'] as String;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Colors.blue.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          formattedText,
          style: textStyle.copyWith(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
