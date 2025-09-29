// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatScreenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenEvent()';
}


}

/// @nodoc
class $ChatScreenEventCopyWith<$Res>  {
$ChatScreenEventCopyWith(ChatScreenEvent _, $Res Function(ChatScreenEvent) __);
}


/// Adds pattern-matching-related methods to [ChatScreenEvent].
extension ChatScreenEventPatterns on ChatScreenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMessages value)?  loadMessages,TResult Function( WatchMessages value)?  watchMessages,TResult Function( SendMessage value)?  sendMessage,TResult Function( SendPhoto value)?  sendPhoto,TResult Function( DeleteMessage value)?  deleteMessage,TResult Function( ReadMessage value)?  readMessage,TResult Function( SetReplyMode value)?  setReplyMode,TResult Function( ClearReplyMode value)?  clearReplyMode,TResult Function( ScrollToMessage value)?  scrollToMessage,TResult Function( ClearHighlight value)?  clearHighlight,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMessages() when loadMessages != null:
return loadMessages(_that);case WatchMessages() when watchMessages != null:
return watchMessages(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case ReadMessage() when readMessage != null:
return readMessage(_that);case SetReplyMode() when setReplyMode != null:
return setReplyMode(_that);case ClearReplyMode() when clearReplyMode != null:
return clearReplyMode(_that);case ScrollToMessage() when scrollToMessage != null:
return scrollToMessage(_that);case ClearHighlight() when clearHighlight != null:
return clearHighlight(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMessages value)  loadMessages,required TResult Function( WatchMessages value)  watchMessages,required TResult Function( SendMessage value)  sendMessage,required TResult Function( SendPhoto value)  sendPhoto,required TResult Function( DeleteMessage value)  deleteMessage,required TResult Function( ReadMessage value)  readMessage,required TResult Function( SetReplyMode value)  setReplyMode,required TResult Function( ClearReplyMode value)  clearReplyMode,required TResult Function( ScrollToMessage value)  scrollToMessage,required TResult Function( ClearHighlight value)  clearHighlight,}){
final _that = this;
switch (_that) {
case LoadMessages():
return loadMessages(_that);case WatchMessages():
return watchMessages(_that);case SendMessage():
return sendMessage(_that);case SendPhoto():
return sendPhoto(_that);case DeleteMessage():
return deleteMessage(_that);case ReadMessage():
return readMessage(_that);case SetReplyMode():
return setReplyMode(_that);case ClearReplyMode():
return clearReplyMode(_that);case ScrollToMessage():
return scrollToMessage(_that);case ClearHighlight():
return clearHighlight(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMessages value)?  loadMessages,TResult? Function( WatchMessages value)?  watchMessages,TResult? Function( SendMessage value)?  sendMessage,TResult? Function( SendPhoto value)?  sendPhoto,TResult? Function( DeleteMessage value)?  deleteMessage,TResult? Function( ReadMessage value)?  readMessage,TResult? Function( SetReplyMode value)?  setReplyMode,TResult? Function( ClearReplyMode value)?  clearReplyMode,TResult? Function( ScrollToMessage value)?  scrollToMessage,TResult? Function( ClearHighlight value)?  clearHighlight,}){
final _that = this;
switch (_that) {
case LoadMessages() when loadMessages != null:
return loadMessages(_that);case WatchMessages() when watchMessages != null:
return watchMessages(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case ReadMessage() when readMessage != null:
return readMessage(_that);case SetReplyMode() when setReplyMode != null:
return setReplyMode(_that);case ClearReplyMode() when clearReplyMode != null:
return clearReplyMode(_that);case ScrollToMessage() when scrollToMessage != null:
return scrollToMessage(_that);case ClearHighlight() when clearHighlight != null:
return clearHighlight(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String chatId)?  loadMessages,TResult Function( String chatId)?  watchMessages,TResult Function( MessageParams message)?  sendMessage,TResult Function( MessageParams message,  Uint8List file)?  sendPhoto,TResult Function( DeleteMessageParams params)?  deleteMessage,TResult Function( MessageParams message)?  readMessage,TResult Function( MessageParams message)?  setReplyMode,TResult Function()?  clearReplyMode,TResult Function( String messageId)?  scrollToMessage,TResult Function()?  clearHighlight,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMessages() when loadMessages != null:
return loadMessages(_that.chatId);case WatchMessages() when watchMessages != null:
return watchMessages(_that.chatId);case SendMessage() when sendMessage != null:
return sendMessage(_that.message);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that.message,_that.file);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.params);case ReadMessage() when readMessage != null:
return readMessage(_that.message);case SetReplyMode() when setReplyMode != null:
return setReplyMode(_that.message);case ClearReplyMode() when clearReplyMode != null:
return clearReplyMode();case ScrollToMessage() when scrollToMessage != null:
return scrollToMessage(_that.messageId);case ClearHighlight() when clearHighlight != null:
return clearHighlight();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String chatId)  loadMessages,required TResult Function( String chatId)  watchMessages,required TResult Function( MessageParams message)  sendMessage,required TResult Function( MessageParams message,  Uint8List file)  sendPhoto,required TResult Function( DeleteMessageParams params)  deleteMessage,required TResult Function( MessageParams message)  readMessage,required TResult Function( MessageParams message)  setReplyMode,required TResult Function()  clearReplyMode,required TResult Function( String messageId)  scrollToMessage,required TResult Function()  clearHighlight,}) {final _that = this;
switch (_that) {
case LoadMessages():
return loadMessages(_that.chatId);case WatchMessages():
return watchMessages(_that.chatId);case SendMessage():
return sendMessage(_that.message);case SendPhoto():
return sendPhoto(_that.message,_that.file);case DeleteMessage():
return deleteMessage(_that.params);case ReadMessage():
return readMessage(_that.message);case SetReplyMode():
return setReplyMode(_that.message);case ClearReplyMode():
return clearReplyMode();case ScrollToMessage():
return scrollToMessage(_that.messageId);case ClearHighlight():
return clearHighlight();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String chatId)?  loadMessages,TResult? Function( String chatId)?  watchMessages,TResult? Function( MessageParams message)?  sendMessage,TResult? Function( MessageParams message,  Uint8List file)?  sendPhoto,TResult? Function( DeleteMessageParams params)?  deleteMessage,TResult? Function( MessageParams message)?  readMessage,TResult? Function( MessageParams message)?  setReplyMode,TResult? Function()?  clearReplyMode,TResult? Function( String messageId)?  scrollToMessage,TResult? Function()?  clearHighlight,}) {final _that = this;
switch (_that) {
case LoadMessages() when loadMessages != null:
return loadMessages(_that.chatId);case WatchMessages() when watchMessages != null:
return watchMessages(_that.chatId);case SendMessage() when sendMessage != null:
return sendMessage(_that.message);case SendPhoto() when sendPhoto != null:
return sendPhoto(_that.message,_that.file);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.params);case ReadMessage() when readMessage != null:
return readMessage(_that.message);case SetReplyMode() when setReplyMode != null:
return setReplyMode(_that.message);case ClearReplyMode() when clearReplyMode != null:
return clearReplyMode();case ScrollToMessage() when scrollToMessage != null:
return scrollToMessage(_that.messageId);case ClearHighlight() when clearHighlight != null:
return clearHighlight();case _:
  return null;

}
}

}

/// @nodoc


class LoadMessages implements ChatScreenEvent {
  const LoadMessages(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMessagesCopyWith<LoadMessages> get copyWith => _$LoadMessagesCopyWithImpl<LoadMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMessages&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatScreenEvent.loadMessages(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $LoadMessagesCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $LoadMessagesCopyWith(LoadMessages value, $Res Function(LoadMessages) _then) = _$LoadMessagesCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class _$LoadMessagesCopyWithImpl<$Res>
    implements $LoadMessagesCopyWith<$Res> {
  _$LoadMessagesCopyWithImpl(this._self, this._then);

  final LoadMessages _self;
  final $Res Function(LoadMessages) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(LoadMessages(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchMessages implements ChatScreenEvent {
  const WatchMessages(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchMessagesCopyWith<WatchMessages> get copyWith => _$WatchMessagesCopyWithImpl<WatchMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchMessages&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatScreenEvent.watchMessages(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $WatchMessagesCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $WatchMessagesCopyWith(WatchMessages value, $Res Function(WatchMessages) _then) = _$WatchMessagesCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class _$WatchMessagesCopyWithImpl<$Res>
    implements $WatchMessagesCopyWith<$Res> {
  _$WatchMessagesCopyWithImpl(this._self, this._then);

  final WatchMessages _self;
  final $Res Function(WatchMessages) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(WatchMessages(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendMessage implements ChatScreenEvent {
  const SendMessage(this.message);
  

 final  MessageParams message;

/// Create a copy of ChatScreenEvent
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
  return 'ChatScreenEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
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

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatScreenEvent
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


class SendPhoto implements ChatScreenEvent {
  const SendPhoto(this.message, this.file);
  

 final  MessageParams message;
 final  Uint8List file;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendPhotoCopyWith<SendPhoto> get copyWith => _$SendPhotoCopyWithImpl<SendPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPhoto&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.file, file));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(file));

@override
String toString() {
  return 'ChatScreenEvent.sendPhoto(message: $message, file: $file)';
}


}

/// @nodoc
abstract mixin class $SendPhotoCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $SendPhotoCopyWith(SendPhoto value, $Res Function(SendPhoto) _then) = _$SendPhotoCopyWithImpl;
@useResult
$Res call({
 MessageParams message, Uint8List file
});


$MessageParamsCopyWith<$Res> get message;

}
/// @nodoc
class _$SendPhotoCopyWithImpl<$Res>
    implements $SendPhotoCopyWith<$Res> {
  _$SendPhotoCopyWithImpl(this._self, this._then);

  final SendPhoto _self;
  final $Res Function(SendPhoto) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? file = null,}) {
  return _then(SendPhoto(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

/// Create a copy of ChatScreenEvent
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


class DeleteMessage implements ChatScreenEvent {
  const DeleteMessage(this.params);
  

 final  DeleteMessageParams params;

/// Create a copy of ChatScreenEvent
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
  return 'ChatScreenEvent.deleteMessage(params: $params)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
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

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(DeleteMessage(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as DeleteMessageParams,
  ));
}

/// Create a copy of ChatScreenEvent
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


class ReadMessage implements ChatScreenEvent {
  const ReadMessage(this.message);
  

 final  MessageParams message;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadMessageCopyWith<ReadMessage> get copyWith => _$ReadMessageCopyWithImpl<ReadMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatScreenEvent.readMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReadMessageCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $ReadMessageCopyWith(ReadMessage value, $Res Function(ReadMessage) _then) = _$ReadMessageCopyWithImpl;
@useResult
$Res call({
 MessageParams message
});


$MessageParamsCopyWith<$Res> get message;

}
/// @nodoc
class _$ReadMessageCopyWithImpl<$Res>
    implements $ReadMessageCopyWith<$Res> {
  _$ReadMessageCopyWithImpl(this._self, this._then);

  final ReadMessage _self;
  final $Res Function(ReadMessage) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReadMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatScreenEvent
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


class SetReplyMode implements ChatScreenEvent {
  const SetReplyMode(this.message);
  

 final  MessageParams message;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetReplyModeCopyWith<SetReplyMode> get copyWith => _$SetReplyModeCopyWithImpl<SetReplyMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetReplyMode&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatScreenEvent.setReplyMode(message: $message)';
}


}

/// @nodoc
abstract mixin class $SetReplyModeCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $SetReplyModeCopyWith(SetReplyMode value, $Res Function(SetReplyMode) _then) = _$SetReplyModeCopyWithImpl;
@useResult
$Res call({
 MessageParams message
});


$MessageParamsCopyWith<$Res> get message;

}
/// @nodoc
class _$SetReplyModeCopyWithImpl<$Res>
    implements $SetReplyModeCopyWith<$Res> {
  _$SetReplyModeCopyWithImpl(this._self, this._then);

  final SetReplyMode _self;
  final $Res Function(SetReplyMode) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SetReplyMode(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatScreenEvent
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


class ClearReplyMode implements ChatScreenEvent {
  const ClearReplyMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearReplyMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenEvent.clearReplyMode()';
}


}




/// @nodoc


class ScrollToMessage implements ChatScreenEvent {
  const ScrollToMessage(this.messageId);
  

 final  String messageId;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrollToMessageCopyWith<ScrollToMessage> get copyWith => _$ScrollToMessageCopyWithImpl<ScrollToMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrollToMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'ChatScreenEvent.scrollToMessage(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $ScrollToMessageCopyWith<$Res> implements $ChatScreenEventCopyWith<$Res> {
  factory $ScrollToMessageCopyWith(ScrollToMessage value, $Res Function(ScrollToMessage) _then) = _$ScrollToMessageCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$ScrollToMessageCopyWithImpl<$Res>
    implements $ScrollToMessageCopyWith<$Res> {
  _$ScrollToMessageCopyWithImpl(this._self, this._then);

  final ScrollToMessage _self;
  final $Res Function(ScrollToMessage) _then;

/// Create a copy of ChatScreenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(ScrollToMessage(
null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearHighlight implements ChatScreenEvent {
  const ClearHighlight();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearHighlight);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenEvent.clearHighlight()';
}


}




/// @nodoc
mixin _$ChatScreenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatScreenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenState()';
}


}

/// @nodoc
class $ChatScreenStateCopyWith<$Res>  {
$ChatScreenStateCopyWith(ChatScreenState _, $Res Function(ChatScreenState) __);
}


/// Adds pattern-matching-related methods to [ChatScreenState].
extension ChatScreenStatePatterns on ChatScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MessageParams> messages,  bool isReplyMode,  MessageParams? replyToMessage,  bool isScrollingToMessage,  String? highlightedMessageId)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.messages,_that.isReplyMode,_that.replyToMessage,_that.isScrollingToMessage,_that.highlightedMessageId);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MessageParams> messages,  bool isReplyMode,  MessageParams? replyToMessage,  bool isScrollingToMessage,  String? highlightedMessageId)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.messages,_that.isReplyMode,_that.replyToMessage,_that.isScrollingToMessage,_that.highlightedMessageId);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MessageParams> messages,  bool isReplyMode,  MessageParams? replyToMessage,  bool isScrollingToMessage,  String? highlightedMessageId)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.messages,_that.isReplyMode,_that.replyToMessage,_that.isScrollingToMessage,_that.highlightedMessageId);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ChatScreenState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenState.initial()';
}


}




/// @nodoc


class Loading implements ChatScreenState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatScreenState.loading()';
}


}




/// @nodoc


class Loaded implements ChatScreenState {
  const Loaded({final  List<MessageParams> messages = const [], this.isReplyMode = false, this.replyToMessage, this.isScrollingToMessage = false, this.highlightedMessageId}): _messages = messages;
  

 final  List<MessageParams> _messages;
@JsonKey() List<MessageParams> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@JsonKey() final  bool isReplyMode;
 final  MessageParams? replyToMessage;
@JsonKey() final  bool isScrollingToMessage;
 final  String? highlightedMessageId;

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isReplyMode, isReplyMode) || other.isReplyMode == isReplyMode)&&(identical(other.replyToMessage, replyToMessage) || other.replyToMessage == replyToMessage)&&(identical(other.isScrollingToMessage, isScrollingToMessage) || other.isScrollingToMessage == isScrollingToMessage)&&(identical(other.highlightedMessageId, highlightedMessageId) || other.highlightedMessageId == highlightedMessageId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isReplyMode,replyToMessage,isScrollingToMessage,highlightedMessageId);

@override
String toString() {
  return 'ChatScreenState.loaded(messages: $messages, isReplyMode: $isReplyMode, replyToMessage: $replyToMessage, isScrollingToMessage: $isScrollingToMessage, highlightedMessageId: $highlightedMessageId)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ChatScreenStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<MessageParams> messages, bool isReplyMode, MessageParams? replyToMessage, bool isScrollingToMessage, String? highlightedMessageId
});


$MessageParamsCopyWith<$Res>? get replyToMessage;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isReplyMode = null,Object? replyToMessage = freezed,Object? isScrollingToMessage = null,Object? highlightedMessageId = freezed,}) {
  return _then(Loaded(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageParams>,isReplyMode: null == isReplyMode ? _self.isReplyMode : isReplyMode // ignore: cast_nullable_to_non_nullable
as bool,replyToMessage: freezed == replyToMessage ? _self.replyToMessage : replyToMessage // ignore: cast_nullable_to_non_nullable
as MessageParams?,isScrollingToMessage: null == isScrollingToMessage ? _self.isScrollingToMessage : isScrollingToMessage // ignore: cast_nullable_to_non_nullable
as bool,highlightedMessageId: freezed == highlightedMessageId ? _self.highlightedMessageId : highlightedMessageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<$Res>? get replyToMessage {
    if (_self.replyToMessage == null) {
    return null;
  }

  return $MessageParamsCopyWith<$Res>(_self.replyToMessage!, (value) {
    return _then(_self.copyWith(replyToMessage: value));
  });
}
}

/// @nodoc


class Error implements ChatScreenState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of ChatScreenState
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
  return 'ChatScreenState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ChatScreenStateCopyWith<$Res> {
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

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
