import 'package:freezed_annotation/freezed_annotation.dart';

part 'citation.freezed.dart';
part 'citation.g.dart';

enum CitationSource { zotero, mendeley, manual }

@freezed
class Citation with _$Citation {
  const Citation._();

  const factory Citation({
    required String citeKey,
    required String title,
    required List<String> authors,
    int? year,
    String? journal,
    String? volume,
    String? issue,
    String? pages,
    String? doi,
    String? url,
    required CitationSource source,
  }) = _Citation;

  factory Citation.fromJson(Map<String, dynamic> json) => _$CitationFromJson(json);
}
// Trigger rebuild
