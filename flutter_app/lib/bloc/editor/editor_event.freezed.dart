// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditorEvent()';
}


}

/// @nodoc
class $EditorEventCopyWith<$Res>  {
$EditorEventCopyWith(EditorEvent _, $Res Function(EditorEvent) __);
}


/// Adds pattern-matching-related methods to [EditorEvent].
extension EditorEventPatterns on EditorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDocument value)?  loadDocument,TResult Function( _SaveDocument value)?  saveDocument,TResult Function( _ContentChanged value)?  contentChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDocument() when loadDocument != null:
return loadDocument(_that);case _SaveDocument() when saveDocument != null:
return saveDocument(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDocument value)  loadDocument,required TResult Function( _SaveDocument value)  saveDocument,required TResult Function( _ContentChanged value)  contentChanged,}){
final _that = this;
switch (_that) {
case _LoadDocument():
return loadDocument(_that);case _SaveDocument():
return saveDocument(_that);case _ContentChanged():
return contentChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDocument value)?  loadDocument,TResult? Function( _SaveDocument value)?  saveDocument,TResult? Function( _ContentChanged value)?  contentChanged,}){
final _that = this;
switch (_that) {
case _LoadDocument() when loadDocument != null:
return loadDocument(_that);case _SaveDocument() when saveDocument != null:
return saveDocument(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int documentId)?  loadDocument,TResult Function()?  saveDocument,TResult Function()?  contentChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDocument() when loadDocument != null:
return loadDocument(_that.documentId);case _SaveDocument() when saveDocument != null:
return saveDocument();case _ContentChanged() when contentChanged != null:
return contentChanged();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int documentId)  loadDocument,required TResult Function()  saveDocument,required TResult Function()  contentChanged,}) {final _that = this;
switch (_that) {
case _LoadDocument():
return loadDocument(_that.documentId);case _SaveDocument():
return saveDocument();case _ContentChanged():
return contentChanged();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int documentId)?  loadDocument,TResult? Function()?  saveDocument,TResult? Function()?  contentChanged,}) {final _that = this;
switch (_that) {
case _LoadDocument() when loadDocument != null:
return loadDocument(_that.documentId);case _SaveDocument() when saveDocument != null:
return saveDocument();case _ContentChanged() when contentChanged != null:
return contentChanged();case _:
  return null;

}
}

}

/// @nodoc


class _LoadDocument implements EditorEvent {
  const _LoadDocument(this.documentId);
  

 final  int documentId;

/// Create a copy of EditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDocumentCopyWith<_LoadDocument> get copyWith => __$LoadDocumentCopyWithImpl<_LoadDocument>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDocument&&(identical(other.documentId, documentId) || other.documentId == documentId));
}


@override
int get hashCode => Object.hash(runtimeType,documentId);

@override
String toString() {
  return 'EditorEvent.loadDocument(documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class _$LoadDocumentCopyWith<$Res> implements $EditorEventCopyWith<$Res> {
  factory _$LoadDocumentCopyWith(_LoadDocument value, $Res Function(_LoadDocument) _then) = __$LoadDocumentCopyWithImpl;
@useResult
$Res call({
 int documentId
});




}
/// @nodoc
class __$LoadDocumentCopyWithImpl<$Res>
    implements _$LoadDocumentCopyWith<$Res> {
  __$LoadDocumentCopyWithImpl(this._self, this._then);

  final _LoadDocument _self;
  final $Res Function(_LoadDocument) _then;

/// Create a copy of EditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentId = null,}) {
  return _then(_LoadDocument(
null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SaveDocument implements EditorEvent {
  const _SaveDocument();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveDocument);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditorEvent.saveDocument()';
}


}




/// @nodoc


class _ContentChanged implements EditorEvent {
  const _ContentChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditorEvent.contentChanged()';
}


}




// dart format on
