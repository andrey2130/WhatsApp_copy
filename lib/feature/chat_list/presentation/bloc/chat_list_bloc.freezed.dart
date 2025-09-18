// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent()';
}


}

/// @nodoc
class $ChatListEventCopyWith<$Res>  {
$ChatListEventCopyWith(ChatListEvent _, $Res Function(ChatListEvent) __);
}


/// Adds pattern-matching-related methods to [ChatListEvent].
extension ChatListEventPatterns on ChatListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAllConversations value)?  loadAllConversations,TResult Function( LoadAllMessages value)?  loadAllMessages,TResult Function( SendMessage value)?  sendMessage,TResult Function( SendConversation value)?  sendConversation,TResult Function( UpdateConversation value)?  updateConversation,TResult Function( DeleteConversation value)?  deleteConversation,TResult Function( DeleteMessage value)?  deleteMessage,TResult Function( UpdateMessage value)?  updateMessage,TResult Function( SubscribeMessages value)?  subscribeMessages,TResult Function( SubscribeConversations value)?  subscribeConversations,TResult Function( FilterChanged value)?  filterChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAllConversations() when loadAllConversations != null:
return loadAllConversations(_that);case LoadAllMessages() when loadAllMessages != null:
return loadAllMessages(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case SendConversation() when sendConversation != null:
return sendConversation(_that);case UpdateConversation() when updateConversation != null:
return updateConversation(_that);case DeleteConversation() when deleteConversation != null:
return deleteConversation(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case UpdateMessage() when updateMessage != null:
return updateMessage(_that);case SubscribeMessages() when subscribeMessages != null:
return subscribeMessages(_that);case SubscribeConversations() when subscribeConversations != null:
return subscribeConversations(_that);case FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAllConversations value)  loadAllConversations,required TResult Function( LoadAllMessages value)  loadAllMessages,required TResult Function( SendMessage value)  sendMessage,required TResult Function( SendConversation value)  sendConversation,required TResult Function( UpdateConversation value)  updateConversation,required TResult Function( DeleteConversation value)  deleteConversation,required TResult Function( DeleteMessage value)  deleteMessage,required TResult Function( UpdateMessage value)  updateMessage,required TResult Function( SubscribeMessages value)  subscribeMessages,required TResult Function( SubscribeConversations value)  subscribeConversations,required TResult Function( FilterChanged value)  filterChanged,}){
final _that = this;
switch (_that) {
case LoadAllConversations():
return loadAllConversations(_that);case LoadAllMessages():
return loadAllMessages(_that);case SendMessage():
return sendMessage(_that);case SendConversation():
return sendConversation(_that);case UpdateConversation():
return updateConversation(_that);case DeleteConversation():
return deleteConversation(_that);case DeleteMessage():
return deleteMessage(_that);case UpdateMessage():
return updateMessage(_that);case SubscribeMessages():
return subscribeMessages(_that);case SubscribeConversations():
return subscribeConversations(_that);case FilterChanged():
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAllConversations value)?  loadAllConversations,TResult? Function( LoadAllMessages value)?  loadAllMessages,TResult? Function( SendMessage value)?  sendMessage,TResult? Function( SendConversation value)?  sendConversation,TResult? Function( UpdateConversation value)?  updateConversation,TResult? Function( DeleteConversation value)?  deleteConversation,TResult? Function( DeleteMessage value)?  deleteMessage,TResult? Function( UpdateMessage value)?  updateMessage,TResult? Function( SubscribeMessages value)?  subscribeMessages,TResult? Function( SubscribeConversations value)?  subscribeConversations,TResult? Function( FilterChanged value)?  filterChanged,}){
final _that = this;
switch (_that) {
case LoadAllConversations() when loadAllConversations != null:
return loadAllConversations(_that);case LoadAllMessages() when loadAllMessages != null:
return loadAllMessages(_that);case SendMessage() when sendMessage != null:
return sendMessage(_that);case SendConversation() when sendConversation != null:
return sendConversation(_that);case UpdateConversation() when updateConversation != null:
return updateConversation(_that);case DeleteConversation() when deleteConversation != null:
return deleteConversation(_that);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case UpdateMessage() when updateMessage != null:
return updateMessage(_that);case SubscribeMessages() when subscribeMessages != null:
return subscribeMessages(_that);case SubscribeConversations() when subscribeConversations != null:
return subscribeConversations(_that);case FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAllConversations,TResult Function()?  loadAllMessages,TResult Function( MessageParams message)?  sendMessage,TResult Function( ConversationParams conversation)?  sendConversation,TResult Function( ConversationParams conversation)?  updateConversation,TResult Function( String conversationId)?  deleteConversation,TResult Function( String messageId)?  deleteMessage,TResult Function( MessageParams message)?  updateMessage,TResult Function( String conversationId)?  subscribeMessages,TResult Function()?  subscribeConversations,TResult Function( String filter)?  filterChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAllConversations() when loadAllConversations != null:
return loadAllConversations();case LoadAllMessages() when loadAllMessages != null:
return loadAllMessages();case SendMessage() when sendMessage != null:
return sendMessage(_that.message);case SendConversation() when sendConversation != null:
return sendConversation(_that.conversation);case UpdateConversation() when updateConversation != null:
return updateConversation(_that.conversation);case DeleteConversation() when deleteConversation != null:
return deleteConversation(_that.conversationId);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messageId);case UpdateMessage() when updateMessage != null:
return updateMessage(_that.message);case SubscribeMessages() when subscribeMessages != null:
return subscribeMessages(_that.conversationId);case SubscribeConversations() when subscribeConversations != null:
return subscribeConversations();case FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAllConversations,required TResult Function()  loadAllMessages,required TResult Function( MessageParams message)  sendMessage,required TResult Function( ConversationParams conversation)  sendConversation,required TResult Function( ConversationParams conversation)  updateConversation,required TResult Function( String conversationId)  deleteConversation,required TResult Function( String messageId)  deleteMessage,required TResult Function( MessageParams message)  updateMessage,required TResult Function( String conversationId)  subscribeMessages,required TResult Function()  subscribeConversations,required TResult Function( String filter)  filterChanged,}) {final _that = this;
switch (_that) {
case LoadAllConversations():
return loadAllConversations();case LoadAllMessages():
return loadAllMessages();case SendMessage():
return sendMessage(_that.message);case SendConversation():
return sendConversation(_that.conversation);case UpdateConversation():
return updateConversation(_that.conversation);case DeleteConversation():
return deleteConversation(_that.conversationId);case DeleteMessage():
return deleteMessage(_that.messageId);case UpdateMessage():
return updateMessage(_that.message);case SubscribeMessages():
return subscribeMessages(_that.conversationId);case SubscribeConversations():
return subscribeConversations();case FilterChanged():
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAllConversations,TResult? Function()?  loadAllMessages,TResult? Function( MessageParams message)?  sendMessage,TResult? Function( ConversationParams conversation)?  sendConversation,TResult? Function( ConversationParams conversation)?  updateConversation,TResult? Function( String conversationId)?  deleteConversation,TResult? Function( String messageId)?  deleteMessage,TResult? Function( MessageParams message)?  updateMessage,TResult? Function( String conversationId)?  subscribeMessages,TResult? Function()?  subscribeConversations,TResult? Function( String filter)?  filterChanged,}) {final _that = this;
switch (_that) {
case LoadAllConversations() when loadAllConversations != null:
return loadAllConversations();case LoadAllMessages() when loadAllMessages != null:
return loadAllMessages();case SendMessage() when sendMessage != null:
return sendMessage(_that.message);case SendConversation() when sendConversation != null:
return sendConversation(_that.conversation);case UpdateConversation() when updateConversation != null:
return updateConversation(_that.conversation);case DeleteConversation() when deleteConversation != null:
return deleteConversation(_that.conversationId);case DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messageId);case UpdateMessage() when updateMessage != null:
return updateMessage(_that.message);case SubscribeMessages() when subscribeMessages != null:
return subscribeMessages(_that.conversationId);case SubscribeConversations() when subscribeConversations != null:
return subscribeConversations();case FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class LoadAllConversations implements ChatListEvent {
  const LoadAllConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAllConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent.loadAllConversations()';
}


}




/// @nodoc


class LoadAllMessages implements ChatListEvent {
  const LoadAllMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAllMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent.loadAllMessages()';
}


}




/// @nodoc


class SendMessage implements ChatListEvent {
  const SendMessage({required this.message});
  

 final  MessageParams message;

/// Create a copy of ChatListEvent
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
  return 'ChatListEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
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

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatListEvent
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


class SendConversation implements ChatListEvent {
  const SendConversation({required this.conversation});
  

 final  ConversationParams conversation;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendConversationCopyWith<SendConversation> get copyWith => _$SendConversationCopyWithImpl<SendConversation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendConversation&&(identical(other.conversation, conversation) || other.conversation == conversation));
}


@override
int get hashCode => Object.hash(runtimeType,conversation);

@override
String toString() {
  return 'ChatListEvent.sendConversation(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $SendConversationCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $SendConversationCopyWith(SendConversation value, $Res Function(SendConversation) _then) = _$SendConversationCopyWithImpl;
@useResult
$Res call({
 ConversationParams conversation
});


$ConversationParamsCopyWith<$Res> get conversation;

}
/// @nodoc
class _$SendConversationCopyWithImpl<$Res>
    implements $SendConversationCopyWith<$Res> {
  _$SendConversationCopyWithImpl(this._self, this._then);

  final SendConversation _self;
  final $Res Function(SendConversation) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(SendConversation(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationParams,
  ));
}

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationParamsCopyWith<$Res> get conversation {
  
  return $ConversationParamsCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

/// @nodoc


class UpdateConversation implements ChatListEvent {
  const UpdateConversation({required this.conversation});
  

 final  ConversationParams conversation;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateConversationCopyWith<UpdateConversation> get copyWith => _$UpdateConversationCopyWithImpl<UpdateConversation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateConversation&&(identical(other.conversation, conversation) || other.conversation == conversation));
}


@override
int get hashCode => Object.hash(runtimeType,conversation);

@override
String toString() {
  return 'ChatListEvent.updateConversation(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $UpdateConversationCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $UpdateConversationCopyWith(UpdateConversation value, $Res Function(UpdateConversation) _then) = _$UpdateConversationCopyWithImpl;
@useResult
$Res call({
 ConversationParams conversation
});


$ConversationParamsCopyWith<$Res> get conversation;

}
/// @nodoc
class _$UpdateConversationCopyWithImpl<$Res>
    implements $UpdateConversationCopyWith<$Res> {
  _$UpdateConversationCopyWithImpl(this._self, this._then);

  final UpdateConversation _self;
  final $Res Function(UpdateConversation) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(UpdateConversation(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationParams,
  ));
}

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationParamsCopyWith<$Res> get conversation {
  
  return $ConversationParamsCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

/// @nodoc


class DeleteConversation implements ChatListEvent {
  const DeleteConversation({required this.conversationId});
  

 final  String conversationId;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteConversationCopyWith<DeleteConversation> get copyWith => _$DeleteConversationCopyWithImpl<DeleteConversation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteConversation&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'ChatListEvent.deleteConversation(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $DeleteConversationCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $DeleteConversationCopyWith(DeleteConversation value, $Res Function(DeleteConversation) _then) = _$DeleteConversationCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$DeleteConversationCopyWithImpl<$Res>
    implements $DeleteConversationCopyWith<$Res> {
  _$DeleteConversationCopyWithImpl(this._self, this._then);

  final DeleteConversation _self;
  final $Res Function(DeleteConversation) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(DeleteConversation(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteMessage implements ChatListEvent {
  const DeleteMessage({required this.messageId});
  

 final  String messageId;

/// Create a copy of ChatListEvent
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
  return 'ChatListEvent.deleteMessage(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
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

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(DeleteMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateMessage implements ChatListEvent {
  const UpdateMessage({required this.message});
  

 final  MessageParams message;

/// Create a copy of ChatListEvent
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
  return 'ChatListEvent.updateMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateMessageCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
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

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageParams,
  ));
}

/// Create a copy of ChatListEvent
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


class SubscribeMessages implements ChatListEvent {
  const SubscribeMessages({required this.conversationId});
  

 final  String conversationId;

/// Create a copy of ChatListEvent
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
  return 'ChatListEvent.subscribeMessages(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $SubscribeMessagesCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
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

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(SubscribeMessages(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubscribeConversations implements ChatListEvent {
  const SubscribeConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent.subscribeConversations()';
}


}




/// @nodoc


class FilterChanged implements ChatListEvent {
  const FilterChanged({required this.filter});
  

 final  String filter;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterChangedCopyWith<FilterChanged> get copyWith => _$FilterChangedCopyWithImpl<FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ChatListEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $FilterChangedCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $FilterChangedCopyWith(FilterChanged value, $Res Function(FilterChanged) _then) = _$FilterChangedCopyWithImpl;
@useResult
$Res call({
 String filter
});




}
/// @nodoc
class _$FilterChangedCopyWithImpl<$Res>
    implements $FilterChangedCopyWith<$Res> {
  _$FilterChangedCopyWithImpl(this._self, this._then);

  final FilterChanged _self;
  final $Res Function(FilterChanged) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(FilterChanged(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ChatListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState()';
}


}

/// @nodoc
class $ChatListStateCopyWith<$Res>  {
$ChatListStateCopyWith(ChatListState _, $Res Function(ChatListState) __);
}


/// Adds pattern-matching-related methods to [ChatListState].
extension ChatListStatePatterns on ChatListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ConversationsLoading value)?  conversationsLoading,TResult Function( ConversationsSuccess value)?  conversationsSuccess,TResult Function( ConversationsError value)?  conversationsError,TResult Function( MessagesLoading value)?  messagesLoading,TResult Function( MessagesSuccess value)?  messagesSuccess,TResult Function( MessagesError value)?  messagesError,TResult Function( ChatListLoaded value)?  filterChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ConversationsLoading() when conversationsLoading != null:
return conversationsLoading(_that);case ConversationsSuccess() when conversationsSuccess != null:
return conversationsSuccess(_that);case ConversationsError() when conversationsError != null:
return conversationsError(_that);case MessagesLoading() when messagesLoading != null:
return messagesLoading(_that);case MessagesSuccess() when messagesSuccess != null:
return messagesSuccess(_that);case MessagesError() when messagesError != null:
return messagesError(_that);case ChatListLoaded() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ConversationsLoading value)  conversationsLoading,required TResult Function( ConversationsSuccess value)  conversationsSuccess,required TResult Function( ConversationsError value)  conversationsError,required TResult Function( MessagesLoading value)  messagesLoading,required TResult Function( MessagesSuccess value)  messagesSuccess,required TResult Function( MessagesError value)  messagesError,required TResult Function( ChatListLoaded value)  filterChanged,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ConversationsLoading():
return conversationsLoading(_that);case ConversationsSuccess():
return conversationsSuccess(_that);case ConversationsError():
return conversationsError(_that);case MessagesLoading():
return messagesLoading(_that);case MessagesSuccess():
return messagesSuccess(_that);case MessagesError():
return messagesError(_that);case ChatListLoaded():
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ConversationsLoading value)?  conversationsLoading,TResult? Function( ConversationsSuccess value)?  conversationsSuccess,TResult? Function( ConversationsError value)?  conversationsError,TResult? Function( MessagesLoading value)?  messagesLoading,TResult? Function( MessagesSuccess value)?  messagesSuccess,TResult? Function( MessagesError value)?  messagesError,TResult? Function( ChatListLoaded value)?  filterChanged,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ConversationsLoading() when conversationsLoading != null:
return conversationsLoading(_that);case ConversationsSuccess() when conversationsSuccess != null:
return conversationsSuccess(_that);case ConversationsError() when conversationsError != null:
return conversationsError(_that);case MessagesLoading() when messagesLoading != null:
return messagesLoading(_that);case MessagesSuccess() when messagesSuccess != null:
return messagesSuccess(_that);case MessagesError() when messagesError != null:
return messagesError(_that);case ChatListLoaded() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  conversationsLoading,TResult Function( List<ConversationParams> conversations)?  conversationsSuccess,TResult Function( String message)?  conversationsError,TResult Function( String conversationId,  List<ConversationParams> conversations)?  messagesLoading,TResult Function( String conversationId,  List<ConversationParams> conversations,  List<MessageParams> messages)?  messagesSuccess,TResult Function( String conversationId,  String message)?  messagesError,TResult Function( String filter)?  filterChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ConversationsLoading() when conversationsLoading != null:
return conversationsLoading();case ConversationsSuccess() when conversationsSuccess != null:
return conversationsSuccess(_that.conversations);case ConversationsError() when conversationsError != null:
return conversationsError(_that.message);case MessagesLoading() when messagesLoading != null:
return messagesLoading(_that.conversationId,_that.conversations);case MessagesSuccess() when messagesSuccess != null:
return messagesSuccess(_that.conversationId,_that.conversations,_that.messages);case MessagesError() when messagesError != null:
return messagesError(_that.conversationId,_that.message);case ChatListLoaded() when filterChanged != null:
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  conversationsLoading,required TResult Function( List<ConversationParams> conversations)  conversationsSuccess,required TResult Function( String message)  conversationsError,required TResult Function( String conversationId,  List<ConversationParams> conversations)  messagesLoading,required TResult Function( String conversationId,  List<ConversationParams> conversations,  List<MessageParams> messages)  messagesSuccess,required TResult Function( String conversationId,  String message)  messagesError,required TResult Function( String filter)  filterChanged,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ConversationsLoading():
return conversationsLoading();case ConversationsSuccess():
return conversationsSuccess(_that.conversations);case ConversationsError():
return conversationsError(_that.message);case MessagesLoading():
return messagesLoading(_that.conversationId,_that.conversations);case MessagesSuccess():
return messagesSuccess(_that.conversationId,_that.conversations,_that.messages);case MessagesError():
return messagesError(_that.conversationId,_that.message);case ChatListLoaded():
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  conversationsLoading,TResult? Function( List<ConversationParams> conversations)?  conversationsSuccess,TResult? Function( String message)?  conversationsError,TResult? Function( String conversationId,  List<ConversationParams> conversations)?  messagesLoading,TResult? Function( String conversationId,  List<ConversationParams> conversations,  List<MessageParams> messages)?  messagesSuccess,TResult? Function( String conversationId,  String message)?  messagesError,TResult? Function( String filter)?  filterChanged,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ConversationsLoading() when conversationsLoading != null:
return conversationsLoading();case ConversationsSuccess() when conversationsSuccess != null:
return conversationsSuccess(_that.conversations);case ConversationsError() when conversationsError != null:
return conversationsError(_that.message);case MessagesLoading() when messagesLoading != null:
return messagesLoading(_that.conversationId,_that.conversations);case MessagesSuccess() when messagesSuccess != null:
return messagesSuccess(_that.conversationId,_that.conversations,_that.messages);case MessagesError() when messagesError != null:
return messagesError(_that.conversationId,_that.message);case ChatListLoaded() when filterChanged != null:
return filterChanged(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ChatListState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState.initial()';
}


}




/// @nodoc


class ConversationsLoading implements ChatListState {
  const ConversationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState.conversationsLoading()';
}


}




/// @nodoc


class ConversationsSuccess implements ChatListState {
  const ConversationsSuccess({required final  List<ConversationParams> conversations}): _conversations = conversations;
  

 final  List<ConversationParams> _conversations;
 List<ConversationParams> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationsSuccessCopyWith<ConversationsSuccess> get copyWith => _$ConversationsSuccessCopyWithImpl<ConversationsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsSuccess&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'ChatListState.conversationsSuccess(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $ConversationsSuccessCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $ConversationsSuccessCopyWith(ConversationsSuccess value, $Res Function(ConversationsSuccess) _then) = _$ConversationsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ConversationParams> conversations
});




}
/// @nodoc
class _$ConversationsSuccessCopyWithImpl<$Res>
    implements $ConversationsSuccessCopyWith<$Res> {
  _$ConversationsSuccessCopyWithImpl(this._self, this._then);

  final ConversationsSuccess _self;
  final $Res Function(ConversationsSuccess) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(ConversationsSuccess(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationParams>,
  ));
}


}

/// @nodoc


class ConversationsError implements ChatListState {
  const ConversationsError({required this.message});
  

 final  String message;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationsErrorCopyWith<ConversationsError> get copyWith => _$ConversationsErrorCopyWithImpl<ConversationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatListState.conversationsError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConversationsErrorCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $ConversationsErrorCopyWith(ConversationsError value, $Res Function(ConversationsError) _then) = _$ConversationsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConversationsErrorCopyWithImpl<$Res>
    implements $ConversationsErrorCopyWith<$Res> {
  _$ConversationsErrorCopyWithImpl(this._self, this._then);

  final ConversationsError _self;
  final $Res Function(ConversationsError) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConversationsError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MessagesLoading implements ChatListState {
  const MessagesLoading({required this.conversationId, required final  List<ConversationParams> conversations}): _conversations = conversations;
  

 final  String conversationId;
 final  List<ConversationParams> _conversations;
 List<ConversationParams> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesLoadingCopyWith<MessagesLoading> get copyWith => _$MessagesLoadingCopyWithImpl<MessagesLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesLoading&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'ChatListState.messagesLoading(conversationId: $conversationId, conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $MessagesLoadingCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $MessagesLoadingCopyWith(MessagesLoading value, $Res Function(MessagesLoading) _then) = _$MessagesLoadingCopyWithImpl;
@useResult
$Res call({
 String conversationId, List<ConversationParams> conversations
});




}
/// @nodoc
class _$MessagesLoadingCopyWithImpl<$Res>
    implements $MessagesLoadingCopyWith<$Res> {
  _$MessagesLoadingCopyWithImpl(this._self, this._then);

  final MessagesLoading _self;
  final $Res Function(MessagesLoading) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? conversations = null,}) {
  return _then(MessagesLoading(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationParams>,
  ));
}


}

/// @nodoc


class MessagesSuccess implements ChatListState {
  const MessagesSuccess({required this.conversationId, required final  List<ConversationParams> conversations, required final  List<MessageParams> messages}): _conversations = conversations,_messages = messages;
  

 final  String conversationId;
 final  List<ConversationParams> _conversations;
 List<ConversationParams> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

 final  List<MessageParams> _messages;
 List<MessageParams> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesSuccessCopyWith<MessagesSuccess> get copyWith => _$MessagesSuccessCopyWithImpl<MessagesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesSuccess&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,const DeepCollectionEquality().hash(_conversations),const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatListState.messagesSuccess(conversationId: $conversationId, conversations: $conversations, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MessagesSuccessCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $MessagesSuccessCopyWith(MessagesSuccess value, $Res Function(MessagesSuccess) _then) = _$MessagesSuccessCopyWithImpl;
@useResult
$Res call({
 String conversationId, List<ConversationParams> conversations, List<MessageParams> messages
});




}
/// @nodoc
class _$MessagesSuccessCopyWithImpl<$Res>
    implements $MessagesSuccessCopyWith<$Res> {
  _$MessagesSuccessCopyWithImpl(this._self, this._then);

  final MessagesSuccess _self;
  final $Res Function(MessagesSuccess) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? conversations = null,Object? messages = null,}) {
  return _then(MessagesSuccess(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationParams>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageParams>,
  ));
}


}

/// @nodoc


class MessagesError implements ChatListState {
  const MessagesError({required this.conversationId, required this.message});
  

 final  String conversationId;
 final  String message;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesErrorCopyWith<MessagesError> get copyWith => _$MessagesErrorCopyWithImpl<MessagesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesError&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,message);

@override
String toString() {
  return 'ChatListState.messagesError(conversationId: $conversationId, message: $message)';
}


}

/// @nodoc
abstract mixin class $MessagesErrorCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $MessagesErrorCopyWith(MessagesError value, $Res Function(MessagesError) _then) = _$MessagesErrorCopyWithImpl;
@useResult
$Res call({
 String conversationId, String message
});




}
/// @nodoc
class _$MessagesErrorCopyWithImpl<$Res>
    implements $MessagesErrorCopyWith<$Res> {
  _$MessagesErrorCopyWithImpl(this._self, this._then);

  final MessagesError _self;
  final $Res Function(MessagesError) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? message = null,}) {
  return _then(MessagesError(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatListLoaded implements ChatListState {
  const ChatListLoaded({required this.filter});
  

 final  String filter;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListLoadedCopyWith<ChatListLoaded> get copyWith => _$ChatListLoadedCopyWithImpl<ChatListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListLoaded&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ChatListState.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ChatListLoadedCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $ChatListLoadedCopyWith(ChatListLoaded value, $Res Function(ChatListLoaded) _then) = _$ChatListLoadedCopyWithImpl;
@useResult
$Res call({
 String filter
});




}
/// @nodoc
class _$ChatListLoadedCopyWithImpl<$Res>
    implements $ChatListLoadedCopyWith<$Res> {
  _$ChatListLoadedCopyWithImpl(this._self, this._then);

  final ChatListLoaded _self;
  final $Res Function(ChatListLoaded) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ChatListLoaded(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
