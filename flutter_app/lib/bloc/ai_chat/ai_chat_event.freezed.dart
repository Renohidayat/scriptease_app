// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiChatEvent()';
}


}

/// @nodoc
class $AiChatEventCopyWith<$Res>  {
$AiChatEventCopyWith(AiChatEvent _, $Res Function(AiChatEvent) __);
}


/// Adds pattern-matching-related methods to [AiChatEvent].
extension AiChatEventPatterns on AiChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SendMessage value)?  sendMessage,TResult Function( _StreamChunkReceived value)?  streamChunkReceived,TResult Function( _StreamCompleted value)?  streamCompleted,TResult Function( _StreamError value)?  streamError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _StreamChunkReceived() when streamChunkReceived != null:
return streamChunkReceived(_that);case _StreamCompleted() when streamCompleted != null:
return streamCompleted(_that);case _StreamError() when streamError != null:
return streamError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SendMessage value)  sendMessage,required TResult Function( _StreamChunkReceived value)  streamChunkReceived,required TResult Function( _StreamCompleted value)  streamCompleted,required TResult Function( _StreamError value)  streamError,}){
final _that = this;
switch (_that) {
case _SendMessage():
return sendMessage(_that);case _StreamChunkReceived():
return streamChunkReceived(_that);case _StreamCompleted():
return streamCompleted(_that);case _StreamError():
return streamError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SendMessage value)?  sendMessage,TResult? Function( _StreamChunkReceived value)?  streamChunkReceived,TResult? Function( _StreamCompleted value)?  streamCompleted,TResult? Function( _StreamError value)?  streamError,}){
final _that = this;
switch (_that) {
case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _StreamChunkReceived() when streamChunkReceived != null:
return streamChunkReceived(_that);case _StreamCompleted() when streamCompleted != null:
return streamCompleted(_that);case _StreamError() when streamError != null:
return streamError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  String documentContent)?  sendMessage,TResult Function( String chunk)?  streamChunkReceived,TResult Function()?  streamCompleted,TResult Function( String error)?  streamError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessage() when sendMessage != null:
return sendMessage(_that.text,_that.documentContent);case _StreamChunkReceived() when streamChunkReceived != null:
return streamChunkReceived(_that.chunk);case _StreamCompleted() when streamCompleted != null:
return streamCompleted();case _StreamError() when streamError != null:
return streamError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  String documentContent)  sendMessage,required TResult Function( String chunk)  streamChunkReceived,required TResult Function()  streamCompleted,required TResult Function( String error)  streamError,}) {final _that = this;
switch (_that) {
case _SendMessage():
return sendMessage(_that.text,_that.documentContent);case _StreamChunkReceived():
return streamChunkReceived(_that.chunk);case _StreamCompleted():
return streamCompleted();case _StreamError():
return streamError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  String documentContent)?  sendMessage,TResult? Function( String chunk)?  streamChunkReceived,TResult? Function()?  streamCompleted,TResult? Function( String error)?  streamError,}) {final _that = this;
switch (_that) {
case _SendMessage() when sendMessage != null:
return sendMessage(_that.text,_that.documentContent);case _StreamChunkReceived() when streamChunkReceived != null:
return streamChunkReceived(_that.chunk);case _StreamCompleted() when streamCompleted != null:
return streamCompleted();case _StreamError() when streamError != null:
return streamError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SendMessage implements AiChatEvent {
  const _SendMessage(this.text, this.documentContent);
  

 final  String text;
 final  String documentContent;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.text, text) || other.text == text)&&(identical(other.documentContent, documentContent) || other.documentContent == documentContent));
}


@override
int get hashCode => Object.hash(runtimeType,text,documentContent);

@override
String toString() {
  return 'AiChatEvent.sendMessage(text: $text, documentContent: $documentContent)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $AiChatEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String text, String documentContent
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? documentContent = null,}) {
  return _then(_SendMessage(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,null == documentContent ? _self.documentContent : documentContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StreamChunkReceived implements AiChatEvent {
  const _StreamChunkReceived(this.chunk);
  

 final  String chunk;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamChunkReceivedCopyWith<_StreamChunkReceived> get copyWith => __$StreamChunkReceivedCopyWithImpl<_StreamChunkReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamChunkReceived&&(identical(other.chunk, chunk) || other.chunk == chunk));
}


@override
int get hashCode => Object.hash(runtimeType,chunk);

@override
String toString() {
  return 'AiChatEvent.streamChunkReceived(chunk: $chunk)';
}


}

/// @nodoc
abstract mixin class _$StreamChunkReceivedCopyWith<$Res> implements $AiChatEventCopyWith<$Res> {
  factory _$StreamChunkReceivedCopyWith(_StreamChunkReceived value, $Res Function(_StreamChunkReceived) _then) = __$StreamChunkReceivedCopyWithImpl;
@useResult
$Res call({
 String chunk
});




}
/// @nodoc
class __$StreamChunkReceivedCopyWithImpl<$Res>
    implements _$StreamChunkReceivedCopyWith<$Res> {
  __$StreamChunkReceivedCopyWithImpl(this._self, this._then);

  final _StreamChunkReceived _self;
  final $Res Function(_StreamChunkReceived) _then;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chunk = null,}) {
  return _then(_StreamChunkReceived(
null == chunk ? _self.chunk : chunk // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StreamCompleted implements AiChatEvent {
  const _StreamCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiChatEvent.streamCompleted()';
}


}




/// @nodoc


class _StreamError implements AiChatEvent {
  const _StreamError(this.error);
  

 final  String error;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamErrorCopyWith<_StreamError> get copyWith => __$StreamErrorCopyWithImpl<_StreamError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AiChatEvent.streamError(error: $error)';
}


}

/// @nodoc
abstract mixin class _$StreamErrorCopyWith<$Res> implements $AiChatEventCopyWith<$Res> {
  factory _$StreamErrorCopyWith(_StreamError value, $Res Function(_StreamError) _then) = __$StreamErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$StreamErrorCopyWithImpl<$Res>
    implements _$StreamErrorCopyWith<$Res> {
  __$StreamErrorCopyWithImpl(this._self, this._then);

  final _StreamError _self;
  final $Res Function(_StreamError) _then;

/// Create a copy of AiChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_StreamError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
