import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';

class CitationBlockEmbed extends CustomBlockEmbed {
  const CitationBlockEmbed(String data) : super(citationType, data);

  static const String citationType = 'citation';

  static CitationBlockEmbed fromCitation(String citeKey, String formattedText) {
    final data = jsonEncode({
      'citeKey': citeKey,
      'formattedText': formattedText,
    });
    return CitationBlockEmbed(data);
  }
}
