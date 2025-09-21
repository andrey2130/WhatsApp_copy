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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadChats value)?  loadChats,TResult Function( CreateChat value)?  createChat,TResult Function( SendMessage value)?  sendMessage,TResult Function( LoadChatMessages value)?  loadChatMessages,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that);case CreateChat() when createChat != null:
return createChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadChats value)  loadChats,required TResult Function( CreateChat value)  createChat,required TResult Function( SendMessage value)  sendMessage,required TResult Function( LoadChatMessages value)  loadChatMessages,}){
final _that = this;
switch (_that) {
case LoadChats():
return loadChats(_that);case CreateChat():
return createChat(_that);case SendMessage():
return sendMessage(_that);case LoadChatMessages():
return loadChatMessages(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadChats value)?  loadChats,TResult? Function( CreateChat value)?  createChat,TResult? Function( SendMessage value)?  sendMessage,TResult? Function( LoadChatMessages value)?  loadChatMessages,}){
final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats(_that);case CreateChat() when createChat != null:
return createChat(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadChats,TResult Function( CreateChatParams params)?  createChat,TResult Function( MessageParams params)?  sendMessage,TResult Function( String chatId)?  loadChatMessages,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats();case CreateChat() when createChat != null:
return createChat(_that.params);case SendMessage() when sendMessage != null:
return sendMessage(_that.params);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that.chatId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadChats,required TResult Function( CreateChatParams params)  createChat,required TResult Function( MessageParams params)  sendMessage,required TResult Function( String chatId)  loadChatMessages,}) {final _that = this;
switch (_that) {
case LoadChats():
return loadChats();case CreateChat():
return createChat(_that.params);case SendMessage():
return sendMessage(_that.params);case LoadChatMessages():
return loadChatMessages(_that.chatId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadChats,TResult? Function( CreateChatParams params)?  createChat,TResult? Function( MessageParams params)?  sendMessage,TResult? Function( String chatId)?  loadChatMessages,}) {final _that = this;
switch (_that) {
case LoadChats() when loadChats != null:
return loadChats();case CreateChat() when createChat != null:
return createChat(_that.params);case SendMessage() when sendMessage != null:
return sendMessage(_that.params);case LoadChatMessages() when loadChatMessages != null:
return loadChatMessages(_that.chatId);case _:
  return null;

}
}

}

/// @nodoc


class LoadChats implements ChatsEvent {
  const LoadChats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadChats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsEvent.loadChats()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( MessagesLoaded value)?  messagesLoaded,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( MessagesLoaded value)  messagesLoaded,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case MessagesLoaded():
return messagesLoaded(_that);case ErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( MessagesLoaded value)?  messagesLoaded,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that);case ErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ChatParams> chats)?  loaded,TResult Function( List<MessageParams> messages)?  messagesLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.chats);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that.messages);case ErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ChatParams> chats)  loaded,required TResult Function( List<MessageParams> messages)  messagesLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.chats);case MessagesLoaded():
return messagesLoaded(_that.messages);case ErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ChatParams> chats)?  loaded,TResult? Function( List<MessageParams> messages)?  messagesLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.chats);case MessagesLoaded() when messagesLoaded != null:
return messagesLoaded(_that.messages);case ErrorState() when error != null:
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
