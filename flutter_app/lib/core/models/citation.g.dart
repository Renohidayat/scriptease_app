// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Citation _$CitationFromJson(Map<String, dynamic> json) => _Citation(
  citeKey: json['citeKey'] as String,
  title: json['title'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  year: (json['year'] as num?)?.toInt(),
  journal: json['journal'] as String?,
  volume: json['volume'] as String?,
  issue: json['issue'] as String?,
  pages: json['pages'] as String?,
  doi: json['doi'] as String?,
  url: json['url'] as String?,
  source: $enumDecode(_$CitationSourceEnumMap, json['source']),
);

Map<String, dynamic> _$CitationToJson(_Citation instance) => <String, dynamic>{
  'citeKey': instance.citeKey,
  'title': instance.title,
  'authors': instance.authors,
  'year': instance.year,
  'journal': instance.journal,
  'volume': instance.volume,
  'issue': instance.issue,
  'pages': instance.pages,
  'doi': instance.doi,
  'url': instance.url,
  'source': _$CitationSourceEnumMap[instance.source]!,
};

const _$CitationSourceEnumMap = {
  CitationSource.zotero: 'zotero',
  CitationSource.mendeley: 'mendeley',
  CitationSource.manual: 'manual',
};
