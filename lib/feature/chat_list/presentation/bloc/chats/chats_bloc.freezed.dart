// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsEvent()';
}


}

/// @nodoc
class $ChatsEventCopyWith<$Res>  {
$ChatsEventCopyWith(ChatsEvent _, $Res Function(ChatsEvent) __);
}


/// Adds pattern-matching-related methods to [ChatsEvent].
extension ChatsEventPatterns on ChatsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadChats value)?  loadChats,TResult Function( CreateChat value)?  createChat,TResult Function( SendMessage value)?  sendMessage,TResult Function( WatchChats value)?  watchChats,TResult Function( WatchMessage value)?  watchMessage,TResult Function( DeleteMessage value)?  deleteMessage,TResult Function( LoadChatMessages value)?  loadChatMessages,TResult Function( ReadMessage value)?  readMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that);case CreateChat() when createChat != null:
return createChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case WatchChats() when watchChats != null:
return watchChats(_that);case WatchMessage() when watchMessage != null:
return watchMessage(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that);case ReadMessage() when readMessage != null:
return readMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadChats value)  loadChats,required TResult Function( CreateChat value)  createChat,required TResult Function( SendMessage value)  sendMessage,required TResult Function( WatchChats value)  watchChats,required TResult Function( WatchMessage value)  watchMessage,required TResult Function( DeleteMessage value)  deleteMessage,required TResult Function( LoadChatMessages value)  loadChatMessages,required TResult Function( ReadMessage value)  readMessage,}){
final _that = this;
switch (_that) {
case LoadChats():
return loadChats(_that);case CreateChat():
return createChat(_that);case SendMessage():
return sendMessage(_that);case WatchChats():
return watchChats(_that);case WatchMessage():
return watchMessage(_that);case DeleteMessage():
return deleteMessage(_that);case LoadChatMessages():
return loadChatMessages(_that);case ReadMessage():
return readMessage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadChats value)?  loadChats,TResult? Function( CreateChat value)?  createChat,TResult? Function( SendMessage value)?  sendMessage,TResult? Function( WatchChats value)?  watchChats,TResult? Function( WatchMessage value)?  watchMessage,TResult? Function( DeleteMessage value)?  deleteMessage,TResult? Function( LoadChatMessages value)?  loadChatMessages,TResult? Function( ReadMessage value)?  readMessage,}){
final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that);case CreateChat() when createChat != null:
return createChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case WatchChats() when watchChats != null:
return watchChats(_that);case WatchMessage() when watchMessage != null:
return watchMessage(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that);case ReadMessage() when readMessage != null:
return readMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String currentUserId,  String? filter)?  loadChats,TResult Function( CreateChatParams params)?  createChat,TResult Function( MessageParams params)?  sendMessage,TResult Function( String currentUserId)?  watchChats,TResult Function( String chatId)?  watchMessage,TResult Function( DeleteMessageParams params)?  deleteMessage,TResult Function( String chatId)?  loadChatMessages,TResult Function( MessageParams params)?  readMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that.currentUserId,_that.filter);case CreateChat() when createChat != null:
return createChat(_that.params);case SendMessage() when sendMessage != null:
return sendMessage(_that.params);case WatchChats() when watchChats != null:
return watchChats(_that.currentUserId);case WatchMessage() when watchMessage != null:
return watchMessage(_that.chatId);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.params);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that.chatId);case ReadMessage() when readMessage != null:
return readMessage(_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String currentUserId,  String? filter)  loadChats,required TResult Function( CreateChatParams params)  createChat,required TResult Function( MessageParams params)  sendMessage,required TResult Function( String currentUserId)  watchChats,required TResult Function( String chatId)  watchMessage,required TResult Function( DeleteMessageParams params)  deleteMessage,required TResult Function( String chatId)  loadChatMessages,required TResult Function( MessageParams params)  readMessage,}) {final _that = this;
switch (_that) {
case LoadChats():
return loadChats(_that.currentUserId,_that.filter);case CreateChat():
return createChat(_that.params);case SendMessage():
return sendMessage(_that.params);case WatchChats():
return watchChats(_that.currentUserId);case WatchMessage():
return watchMessage(_that.chatId);case DeleteMessage():
return deleteMessage(_that.params);case LoadChatMessages():
return loadChatMessages(_that.chatId);case ReadMessage():
return readMessage(_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String currentUserId,  String? filter)?  loadChats,TResult? Function( CreateChatParams params)?  createChat,TResult? Function( MessageParams params)?  sendMessage,TResult? Function( String currentUserId)?  watchChats,TResult? Function( String chatId)?  watchMessage,TResult? Function( DeleteMessageParams params)?  deleteMessage,TResult? Function( String chatId)?  loadChatMessages,TResult? Function( MessageParams params)?  readMessage,}) {final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that.currentUserId,_that.filter);case CreateChat() when createChat != null:
return createChat(_that.params);case SendMessage() when sendMessage != null:
return sendMessage(_that.params);case WatchChats() when watchChats != null:
return watchChats(_that.currentUserId);case WatchMessage() when watchMessage != null:
return watchMessage(_that.chatId);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.params);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that.chatId);case ReadMessage() when readMessage != null:
return readMessage(_that.params);case _:
  return null;

}
}

}

/// @nodoc


class LoadChats implements ChatsEvent {
  const LoadChats(this.currentUserId, this.filter);
  

 final  String currentUserId;
 final  String? filter;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadChatsCopyWith<LoadChats> get copyWith => _$LoadChatsCopyWithImpl<LoadChats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadChats&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId,filter);

@override
String toString() {
  return 'ChatsEvent.loadChats(currentUserId: $currentUserId, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LoadChatsCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $LoadChatsCopyWith(LoadChats value, $Res Function(LoadChats) _then) = _$LoadChatsCopyWithImpl;
@useResult
$Res call({
 String currentUserId, String? filter
});




}
/// @nodoc
class _$LoadChatsCopyWithImpl<$Res>
    implements $LoadChatsCopyWith<$Res> {
  _$LoadChatsCopyWithImpl(this._self, this._then);

  final LoadChats _self;
  final $Res Function(LoadChats) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentUserId = null,Object? filter = freezed,}) {
  return _then(LoadChats(
null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CreateChat implements ChatsEvent {
  const CreateChat(this.params);
  

 final  CreateChatParams params;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChatCopyWith<CreateChat> get copyWith => _$CreateChatCopyWithImpl<CreateChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChat&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'ChatsEvent.createChat(params: $params)';
}


}

/// @nodoc
abstract mixin class $CreateChatCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $CreateChatCopyWith(CreateChat value, $Res Function(CreateChat) _then) = _$CreateChatCopyWithImpl;
@useResult
$Res call({
 CreateChatParams params
});


$CreateChatParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$CreateChatCopyWithImpl<$Res>
    implements $CreateChatCopyWith<$Res> {
  _$CreateChatCopyWithImpl(this._self, this._then);

  final CreateChat _self;
  final $Res Function(CreateChat) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(CreateChat(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CreateChatParams,
  ));
}

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateChatParamsCopyWith<$Res> get params {
  
  return $CreateChatParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class SendMessage implements ChatsEvent {
  const SendMessage(this.params);
  

 final  MessageParams params;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'ChatsEvent.sendMessage(params: $params)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@useResult
$Res call({
 MessageParams params
});


$MessageParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(SendMessage(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<$Res> get params {
  
  return $MessageParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class WatchChats implements ChatsEvent {
  const WatchChats(this.currentUserId);
  

 final  String currentUserId;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchChatsCopyWith<WatchChats> get copyWith => _$WatchChatsCopyWithImpl<WatchChats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchChats&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId);

@override
String toString() {
  return 'ChatsEvent.watchChats(currentUserId: $currentUserId)';
}


}

/// @nodoc
abstract mixin class $WatchChatsCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $WatchChatsCopyWith(WatchChats value, $Res Function(WatchChats) _then) = _$WatchChatsCopyWithImpl;
@useResult
$Res call({
 String currentUserId
});




}
/// @nodoc
class _$WatchChatsCopyWithImpl<$Res>
    implements $WatchChatsCopyWith<$Res> {
  _$WatchChatsCopyWithImpl(this._self, this._then);

  final WatchChats _self;
  final $Res Function(WatchChats) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentUserId = null,}) {
  return _then(WatchChats(
null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchMessage implements ChatsEvent {
  const WatchMessage(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchMessageCopyWith<WatchMessage> get copyWith => _$WatchMessageCopyWithImpl<WatchMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchMessage&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatsEvent.watchMessage(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $WatchMessageCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $WatchMessageCopyWith(WatchMessage value, $Res Function(WatchMessage) _then) = _$WatchMessageCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class _$WatchMessageCopyWithImpl<$Res>
    implements $WatchMessageCopyWith<$Res> {
  _$WatchMessageCopyWithImpl(this._self, this._then);

  final WatchMessage _self;
  final $Res Function(WatchMessage) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(WatchMessage(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteMessage implements ChatsEvent {
  const DeleteMessage(this.params);
  

 final  DeleteMessageParams params;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteMessageCopyWith<DeleteMessage> get copyWith => _$DeleteMessageCopyWithImpl<DeleteMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMessage&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'ChatsEvent.deleteMessage(params: $params)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $DeleteMessageCopyWith(DeleteMessage value, $Res Function(DeleteMessage) _then) = _$DeleteMessageCopyWithImpl;
@useResult
$Res call({
 DeleteMessageParams params
});


$DeleteMessageParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$DeleteMessageCopyWithImpl<$Res>
    implements $DeleteMessageCopyWith<$Res> {
  _$DeleteMessageCopyWithImpl(this._self, this._then);

  final DeleteMessage _self;
  final $Res Function(DeleteMessage) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(DeleteMessage(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as DeleteMessageParams,
  ));
}

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeleteMessageParamsCopyWith<$Res> get params {
  
  return $DeleteMessageParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class LoadChatMessages implements ChatsEvent {
  const LoadChatMessages(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadChatMessagesCopyWith<LoadChatMessages> get copyWith => _$LoadChatMessagesCopyWithImpl<LoadChatMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadChatMessages&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatsEvent.loadChatMessages(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $LoadChatMessagesCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $LoadChatMessagesCopyWith(LoadChatMessages value, $Res Function(LoadChatMessages) _then) = _$LoadChatMessagesCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class _$LoadChatMessagesCopyWithImpl<$Res>
    implements $LoadChatMessagesCopyWith<$Res> {
  _$LoadChatMessagesCopyWithImpl(this._self, this._then);

  final LoadChatMessages _self;
  final $Res Function(LoadChatMessages) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(LoadChatMessages(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReadMessage implements ChatsEvent {
  const ReadMessage(this.params);
  

 final  MessageParams params;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadMessageCopyWith<ReadMessage> get copyWith => _$ReadMessageCopyWithImpl<ReadMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadMessage&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'ChatsEvent.readMessage(params: $params)';
}


}

/// @nodoc
abstract mixin class $ReadMessageCopyWith<$Res> implements $ChatsEventCopyWith<$Res> {
  factory $ReadMessageCopyWith(ReadMessage value, $Res Function(ReadMessage) _then) = _$ReadMessageCopyWithImpl;
@useResult
$Res call({
 MessageParams params
});


$MessageParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$ReadMessageCopyWithImpl<$Res>
    implements $ReadMessageCopyWith<$Res> {
  _$ReadMessageCopyWithImpl(this._self, this._then);

  final ReadMessage _self;
  final $Res Function(ReadMessage) _then;

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(ReadMessage(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<$Res> get params {
  
  return $MessageParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc
mixin _$ChatsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState()';
}


}

/// @nodoc
class $ChatsStateCopyWith<$Res>  {
$ChatsStateCopyWith(ChatsState _, $Res Function(ChatsState) __);
}


/// Adds pattern-matching-related methods to [ChatsState].
extension ChatsStatePatterns on ChatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( MessagesLoaded value)?  messagesLoaded,TResult Function( ChatWithMessages value)?  chatWithMessages,TResult Function( Success value)?  success,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that);case ChatWithMessages() when chatWithMessages != null:
return chatWithMessages(_that);case Success() when success != null:
return success(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( MessagesLoaded value)  messagesLoaded,required TResult Function( ChatWithMessages value)  chatWithMessages,required TResult Function( Success value)  success,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case MessagesLoaded():
return messagesLoaded(_that);case ChatWithMessages():
return chatWithMessages(_that);case Success():
return success(_that);case ErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( MessagesLoaded value)?  messagesLoaded,TResult? Function( ChatWithMessages value)?  chatWithMessages,TResult? Function( Success value)?  success,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that);case ChatWithMessages() when chatWithMessages != null:
return chatWithMessages(_that);case Success() when success != null:
return success(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ChatParams> chats)?  loaded,TResult Function( List<MessageParams> messages)?  messagesLoaded,TResult Function( List<ChatParams> chats,  List<MessageParams> messages)?  chatWithMessages,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.chats);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that.messages);case ChatWithMessages() when chatWithMessages != null:
return chatWithMessages(_that.chats,_that.messages);case Success() when success != null:
return success();case ErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ChatParams> chats)  loaded,required TResult Function( List<MessageParams> messages)  messagesLoaded,required TResult Function( List<ChatParams> chats,  List<MessageParams> messages)  chatWithMessages,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.chats);case MessagesLoaded():
return messagesLoaded(_that.messages);case ChatWithMessages():
return chatWithMessages(_that.chats,_that.messages);case Success():
return success();case ErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ChatParams> chats)?  loaded,TResult? Function( List<MessageParams> messages)?  messagesLoaded,TResult? Function( List<ChatParams> chats,  List<MessageParams> messages)?  chatWithMessages,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.chats);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that.messages);case ChatWithMessages() when chatWithMessages != null:
return chatWithMessages(_that.chats,_that.messages);case Success() when success != null:
return success();case ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ChatsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState.initial()';
}


}




/// @nodoc


class Loading implements ChatsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState.loading()';
}


}




/// @nodoc


class Loaded implements ChatsState {
  const Loaded(final  List<ChatParams> chats): _chats = chats;
  

 final  List<ChatParams> _chats;
 List<ChatParams> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatsState.loaded(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ChatParams> chats
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(Loaded(
null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatParams>,
  ));
}


}

/// @nodoc


class MessagesLoaded implements ChatsState {
  const MessagesLoaded(final  List<MessageParams> messages): _messages = messages;
  

 final  List<MessageParams> _messages;
 List<MessageParams> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesLoadedCopyWith<MessagesLoaded> get copyWith => _$MessagesLoadedCopyWithImpl<MessagesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesLoaded&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatsState.messagesLoaded(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MessagesLoadedCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $MessagesLoadedCopyWith(MessagesLoaded value, $Res Function(MessagesLoaded) _then) = _$MessagesLoadedCopyWithImpl;
@useResult
$Res call({
 List<MessageParams> messages
});




}
/// @nodoc
class _$MessagesLoadedCopyWithImpl<$Res>
    implements $MessagesLoadedCopyWith<$Res> {
  _$MessagesLoadedCopyWithImpl(this._self, this._then);

  final MessagesLoaded _self;
  final $Res Function(MessagesLoaded) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(MessagesLoaded(
null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageParams>,
  ));
}


}

/// @nodoc


class ChatWithMessages implements ChatsState {
  const ChatWithMessages({required final  List<ChatParams> chats, required final  List<MessageParams> messages}): _chats = chats,_messages = messages;
  

 final  List<ChatParams> _chats;
 List<ChatParams> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}

 final  List<MessageParams> _messages;
 List<MessageParams> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatWithMessagesCopyWith<ChatWithMessages> get copyWith => _$ChatWithMessagesCopyWithImpl<ChatWithMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatWithMessages&&const DeepCollectionEquality().equals(other._chats, _chats)&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats),const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatsState.chatWithMessages(chats: $chats, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ChatWithMessagesCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $ChatWithMessagesCopyWith(ChatWithMessages value, $Res Function(ChatWithMessages) _then) = _$ChatWithMessagesCopyWithImpl;
@useResult
$Res call({
 List<ChatParams> chats, List<MessageParams> messages
});




}
/// @nodoc
class _$ChatWithMessagesCopyWithImpl<$Res>
    implements $ChatWithMessagesCopyWith<$Res> {
  _$ChatWithMessagesCopyWithImpl(this._self, this._then);

  final ChatWithMessages _self;
  final $Res Function(ChatWithMessages) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,Object? messages = null,}) {
  return _then(ChatWithMessages(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatParams>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageParams>,
  ));
}


}

/// @nodoc


class Success implements ChatsState {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState.success()';
}


}




/// @nodoc


class ErrorState implements ChatsState {
  const ErrorState(this.message);
  

 final  String message;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
