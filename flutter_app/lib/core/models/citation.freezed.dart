// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'citation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Citation {

 String get citeKey; String get title; List<String> get authors; int? get year; String? get journal; String? get volume; String? get issue; String? get pages; String? get doi; String? get url; CitationSource get source;
/// Create a copy of Citation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitationCopyWith<Citation> get copyWith => _$CitationCopyWithImpl<Citation>(this as Citation, _$identity);

  /// Serializes this Citation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Citation&&(identical(other.citeKey, citeKey) || other.citeKey == citeKey)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.year, year) || other.year == year)&&(identical(other.journal, journal) || other.journal == journal)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.doi, doi) || other.doi == doi)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,citeKey,title,const DeepCollectionEquality().hash(authors),year,journal,volume,issue,pages,doi,url,source);

@override
String toString() {
  return 'Citation(citeKey: $citeKey, title: $title, authors: $authors, year: $year, journal: $journal, volume: $volume, issue: $issue, pages: $pages, doi: $doi, url: $url, source: $source)';
}


}

/// @nodoc
abstract mixin class $CitationCopyWith<$Res>  {
  factory $CitationCopyWith(Citation value, $Res Function(Citation) _then) = _$CitationCopyWithImpl;
@useResult
$Res call({
 String citeKey, String title, List<String> authors, int? year, String? journal, String? volume, String? issue, String? pages, String? doi, String? url, CitationSource source
});




}
/// @nodoc
class _$CitationCopyWithImpl<$Res>
    implements $CitationCopyWith<$Res> {
  _$CitationCopyWithImpl(this._self, this._then);

  final Citation _self;
  final $Res Function(Citation) _then;

/// Create a copy of Citation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? citeKey = null,Object? title = null,Object? authors = null,Object? year = freezed,Object? journal = freezed,Object? volume = freezed,Object? issue = freezed,Object? pages = freezed,Object? doi = freezed,Object? url = freezed,Object? source = null,}) {
  return _then(_self.copyWith(
citeKey: null == citeKey ? _self.citeKey : citeKey // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,journal: freezed == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as String?,volume: freezed == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as String?,doi: freezed == doi ? _self.doi : doi // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CitationSource,
  ));
}

}


/// Adds pattern-matching-related methods to [Citation].
extension CitationPatterns on Citation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Citation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Citation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Citation value)  $default,){
final _that = this;
switch (_that) {
case _Citation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Citation value)?  $default,){
final _that = this;
switch (_that) {
case _Citation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String citeKey,  String title,  List<String> authors,  int? year,  String? journal,  String? volume,  String? issue,  String? pages,  String? doi,  String? url,  CitationSource source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Citation() when $default != null:
return $default(_that.citeKey,_that.title,_that.authors,_that.year,_that.journal,_that.volume,_that.issue,_that.pages,_that.doi,_that.url,_that.source);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String citeKey,  String title,  List<String> authors,  int? year,  String? journal,  String? volume,  String? issue,  String? pages,  String? doi,  String? url,  CitationSource source)  $default,) {final _that = this;
switch (_that) {
case _Citation():
return $default(_that.citeKey,_that.title,_that.authors,_that.year,_that.journal,_that.volume,_that.issue,_that.pages,_that.doi,_that.url,_that.source);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String citeKey,  String title,  List<String> authors,  int? year,  String? journal,  String? volume,  String? issue,  String? pages,  String? doi,  String? url,  CitationSource source)?  $default,) {final _that = this;
switch (_that) {
case _Citation() when $default != null:
return $default(_that.citeKey,_that.title,_that.authors,_that.year,_that.journal,_that.volume,_that.issue,_that.pages,_that.doi,_that.url,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Citation extends Citation {
  const _Citation({required this.citeKey, required this.title, required final  List<String> authors, this.year, this.journal, this.volume, this.issue, this.pages, this.doi, this.url, required this.source}): _authors = authors,super._();
  factory _Citation.fromJson(Map<String, dynamic> json) => _$CitationFromJson(json);

@override final  String citeKey;
@override final  String title;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  int? year;
@override final  String? journal;
@override final  String? volume;
@override final  String? issue;
@override final  String? pages;
@override final  String? doi;
@override final  String? url;
@override final  CitationSource source;

/// Create a copy of Citation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitationCopyWith<_Citation> get copyWith => __$CitationCopyWithImpl<_Citation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CitationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Citation&&(identical(other.citeKey, citeKey) || other.citeKey == citeKey)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.year, year) || other.year == year)&&(identical(other.journal, journal) || other.journal == journal)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.doi, doi) || other.doi == doi)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,citeKey,title,const DeepCollectionEquality().hash(_authors),year,journal,volume,issue,pages,doi,url,source);

@override
String toString() {
  return 'Citation(citeKey: $citeKey, title: $title, authors: $authors, year: $year, journal: $journal, volume: $volume, issue: $issue, pages: $pages, doi: $doi, url: $url, source: $source)';
}


}

/// @nodoc
abstract mixin class _$CitationCopyWith<$Res> implements $CitationCopyWith<$Res> {
  factory _$CitationCopyWith(_Citation value, $Res Function(_Citation) _then) = __$CitationCopyWithImpl;
@override @useResult
$Res call({
 String citeKey, String title, List<String> authors, int? year, String? journal, String? volume, String? issue, String? pages, String? doi, String? url, CitationSource source
});




}
/// @nodoc
class __$CitationCopyWithImpl<$Res>
    implements _$CitationCopyWith<$Res> {
  __$CitationCopyWithImpl(this._self, this._then);

  final _Citation _self;
  final $Res Function(_Citation) _then;

/// Create a copy of Citation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? citeKey = null,Object? title = null,Object? authors = null,Object? year = freezed,Object? journal = freezed,Object? volume = freezed,Object? issue = freezed,Object? pages = freezed,Object? doi = freezed,Object? url = freezed,Object? source = null,}) {
  return _then(_Citation(
citeKey: null == citeKey ? _self.citeKey : citeKey // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,journal: freezed == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as String?,volume: freezed == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as String?,doi: freezed == doi ? _self.doi : doi // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CitationSource,
  ));
}


}

// dart format on
