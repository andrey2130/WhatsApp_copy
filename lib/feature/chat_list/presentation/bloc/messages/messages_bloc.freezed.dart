// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessagesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesEvent()';
}


}

/// @nodoc
class $MessagesEventCopyWith<$Res>  {
$MessagesEventCopyWith(MessagesEvent _, $Res Function(MessagesEvent) __);
}


/// Adds pattern-matching-related methods to [MessagesEvent].
extension MessagesEventPatterns on MessagesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMessages value)?  load,TResult Function( SendMessage value)?  send,TResult Function( UpdateMessage value)?  update,TResult Function( DeleteMessage value)?  delete,TResult Function( SubscribeMessages value)?  subscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMessages() when load != null:
return load(_that);case SendMessage() when send != null:
return send(_that);case UpdateMessage() when update != null:
return update(_that);case DeleteMessage() when delete != null:
return delete(_that);case SubscribeMessages() when subscribe != null:
return subscribe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMessages value)  load,required TResult Function( SendMessage value)  send,required TResult Function( UpdateMessage value)  update,required TResult Function( DeleteMessage value)  delete,required TResult Function( SubscribeMessages value)  subscribe,}){
final _that = this;
switch (_that) {
case LoadMessages():
return load(_that);case SendMessage():
return send(_that);case UpdateMessage():
return update(_that);case DeleteMessage():
return delete(_that);case SubscribeMessages():
return subscribe(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMessages value)?  load,TResult? Function( SendMessage value)?  send,TResult? Function( UpdateMessage value)?  update,TResult? Function( DeleteMessage value)?  delete,TResult? Function( SubscribeMessages value)?  subscribe,}){
final _that = this;
switch (_that) {
case LoadMessages() when load != null:
return load(_that);case SendMessage() when send != null:
return send(_that);case UpdateMessage() when update != null:
return update(_that);case DeleteMessage() when delete != null:
return delete(_that);case SubscribeMessages() when subscribe != null:
return subscribe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( MessageParams message)?  send,TResult Function( MessageParams message)?  update,TResult Function( String messageId)?  delete,TResult Function( String conversationId)?  subscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMessages() when load != null:
return load();case SendMessage() when send != null:
return send(_that.message);case UpdateMessage() when update != null:
return update(_that.message);case DeleteMessage() when delete != null:
return delete(_that.messageId);case SubscribeMessages() when subscribe != null:
return subscribe(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( MessageParams message)  send,required TResult Function( MessageParams message)  update,required TResult Function( String messageId)  delete,required TResult Function( String conversationId)  subscribe,}) {final _that = this;
switch (_that) {
case LoadMessages():
return load();case SendMessage():
return send(_that.message);case UpdateMessage():
return update(_that.message);case DeleteMessage():
return delete(_that.messageId);case SubscribeMessages():
return subscribe(_that.conversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( MessageParams message)?  send,TResult? Function( MessageParams message)?  update,TResult? Function( String messageId)?  delete,TResult? Function( String conversationId)?  subscribe,}) {final _that = this;
switch (_that) {
case LoadMessages() when load != null:
return load();case SendMessage() when send != null:
return send(_that.message);case UpdateMessage() when update != null:
return update(_that.message);case DeleteMessage() when delete != null:
return delete(_that.messageId);case SubscribeMessages() when subscribe != null:
return subscribe(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc


class LoadMessages implements MessagesEvent {
  const LoadMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesEvent.load()';
}


}




/// @nodoc


class SendMessage implements MessagesEvent {
  const SendMessage(this.message);
  

 final  MessageParams message;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessagesEvent.send(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@useResult
$Res call({
 MessageParams message
});


$MessageParamsCopyWith<$Res> get message;

}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<$Res> get message {
  
  return $MessageParamsCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class UpdateMessage implements MessagesEvent {
  const UpdateMessage(this.message);
  

 final  MessageParams message;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMessageCopyWith<UpdateMessage> get copyWith => _$UpdateMessageCopyWithImpl<UpdateMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessagesEvent.update(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateMessageCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory $UpdateMessageCopyWith(UpdateMessage value, $Res Function(UpdateMessage) _then) = _$UpdateMessageCopyWithImpl;
@useResult
$Res call({
 MessageParams message
});


$MessageParamsCopyWith<$Res> get message;

}
/// @nodoc
class _$UpdateMessageCopyWithImpl<$Res>
    implements $UpdateMessageCopyWith<$Res> {
  _$UpdateMessageCopyWithImpl(this._self, this._then);

  final UpdateMessage _self;
  final $Res Function(UpdateMessage) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<$Res> get message {
  
  return $MessageParamsCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class DeleteMessage implements MessagesEvent {
  const DeleteMessage(this.messageId);
  

 final  String messageId;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteMessageCopyWith<DeleteMessage> get copyWith => _$DeleteMessageCopyWithImpl<DeleteMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'MessagesEvent.delete(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory $DeleteMessageCopyWith(DeleteMessage value, $Res Function(DeleteMessage) _then) = _$DeleteMessageCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$DeleteMessageCopyWithImpl<$Res>
    implements $DeleteMessageCopyWith<$Res> {
  _$DeleteMessageCopyWithImpl(this._self, this._then);

  final DeleteMessage _self;
  final $Res Function(DeleteMessage) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(DeleteMessage(
null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubscribeMessages implements MessagesEvent {
  const SubscribeMessages(this.conversationId);
  

 final  String conversationId;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeMessagesCopyWith<SubscribeMessages> get copyWith => _$SubscribeMessagesCopyWithImpl<SubscribeMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeMessages&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'MessagesEvent.subscribe(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $SubscribeMessagesCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory $SubscribeMessagesCopyWith(SubscribeMessages value, $Res Function(SubscribeMessages) _then) = _$SubscribeMessagesCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$SubscribeMessagesCopyWithImpl<$Res>
    implements $SubscribeMessagesCopyWith<$Res> {
  _$SubscribeMessagesCopyWithImpl(this._self, this._then);

  final SubscribeMessages _self;
  final $Res Function(SubscribeMessages) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(SubscribeMessages(
null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MessagesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesState()';
}


}

/// @nodoc
class $MessagesStateCopyWith<$Res>  {
$MessagesStateCopyWith(MessagesState _, $Res Function(MessagesState) __);
}


/// Adds pattern-matching-related methods to [MessagesState].
extension MessagesStatePatterns on MessagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MessageParams> messages)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.messages);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MessageParams> messages)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.messages);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MessageParams> messages)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.messages);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements MessagesState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesState.initial()';
}


}




/// @nodoc


class Loading implements MessagesState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesState.loading()';
}


}




/// @nodoc


class Success implements MessagesState {
  const Success(final  List<MessageParams> messages): _messages = messages;
  

 final  List<MessageParams> _messages;
 List<MessageParams> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'MessagesState.success(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $MessagesStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<MessageParams> messages
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(Success(
null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageParams>,
  ));
}


}

/// @nodoc


class Error implements MessagesState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessagesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $MessagesStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of MessagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
