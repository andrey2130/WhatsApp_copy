// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent()';
}


}

/// @nodoc
class $ConversationsEventCopyWith<$Res>  {
$ConversationsEventCopyWith(ConversationsEvent _, $Res Function(ConversationsEvent) __);
}


/// Adds pattern-matching-related methods to [ConversationsEvent].
extension ConversationsEventPatterns on ConversationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadConversations value)?  load,TResult Function( SendConversation value)?  send,TResult Function( UpdateConversation value)?  update,TResult Function( DeleteConversation value)?  delete,TResult Function( SubscribeConversations value)?  subscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadConversations() when load != null:
return load(_that);case SendConversation() when send != null:
return send(_that);case UpdateConversation() when update != null:
return update(_that);case DeleteConversation() when delete != null:
return delete(_that);case SubscribeConversations() when subscribe != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadConversations value)  load,required TResult Function( SendConversation value)  send,required TResult Function( UpdateConversation value)  update,required TResult Function( DeleteConversation value)  delete,required TResult Function( SubscribeConversations value)  subscribe,}){
final _that = this;
switch (_that) {
case LoadConversations():
return load(_that);case SendConversation():
return send(_that);case UpdateConversation():
return update(_that);case DeleteConversation():
return delete(_that);case SubscribeConversations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadConversations value)?  load,TResult? Function( SendConversation value)?  send,TResult? Function( UpdateConversation value)?  update,TResult? Function( DeleteConversation value)?  delete,TResult? Function( SubscribeConversations value)?  subscribe,}){
final _that = this;
switch (_that) {
case LoadConversations() when load != null:
return load(_that);case SendConversation() when send != null:
return send(_that);case UpdateConversation() when update != null:
return update(_that);case DeleteConversation() when delete != null:
return delete(_that);case SubscribeConversations() when subscribe != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( ConversationParams conversation)?  send,TResult Function( ConversationParams conversation)?  update,TResult Function( String conversationId)?  delete,TResult Function()?  subscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadConversations() when load != null:
return load();case SendConversation() when send != null:
return send(_that.conversation);case UpdateConversation() when update != null:
return update(_that.conversation);case DeleteConversation() when delete != null:
return delete(_that.conversationId);case SubscribeConversations() when subscribe != null:
return subscribe();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( ConversationParams conversation)  send,required TResult Function( ConversationParams conversation)  update,required TResult Function( String conversationId)  delete,required TResult Function()  subscribe,}) {final _that = this;
switch (_that) {
case LoadConversations():
return load();case SendConversation():
return send(_that.conversation);case UpdateConversation():
return update(_that.conversation);case DeleteConversation():
return delete(_that.conversationId);case SubscribeConversations():
return subscribe();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( ConversationParams conversation)?  send,TResult? Function( ConversationParams conversation)?  update,TResult? Function( String conversationId)?  delete,TResult? Function()?  subscribe,}) {final _that = this;
switch (_that) {
case LoadConversations() when load != null:
return load();case SendConversation() when send != null:
return send(_that.conversation);case UpdateConversation() when update != null:
return update(_that.conversation);case DeleteConversation() when delete != null:
return delete(_that.conversationId);case SubscribeConversations() when subscribe != null:
return subscribe();case _:
  return null;

}
}

}

/// @nodoc


class LoadConversations implements ConversationsEvent {
  const LoadConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.load()';
}


}




/// @nodoc


class SendConversation implements ConversationsEvent {
  const SendConversation(this.conversation);
  

 final  ConversationParams conversation;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.send(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $SendConversationCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
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

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(SendConversation(
null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationParams,
  ));
}

/// Create a copy of ConversationsEvent
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


class UpdateConversation implements ConversationsEvent {
  const UpdateConversation(this.conversation);
  

 final  ConversationParams conversation;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.update(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $UpdateConversationCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
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

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(UpdateConversation(
null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ConversationParams,
  ));
}

/// Create a copy of ConversationsEvent
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


class DeleteConversation implements ConversationsEvent {
  const DeleteConversation(this.conversationId);
  

 final  String conversationId;

/// Create a copy of ConversationsEvent
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
  return 'ConversationsEvent.delete(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $DeleteConversationCopyWith<$Res> implements $ConversationsEventCopyWith<$Res> {
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

/// Create a copy of ConversationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(DeleteConversation(
null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubscribeConversations implements ConversationsEvent {
  const SubscribeConversations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeConversations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsEvent.subscribe()';
}


}




/// @nodoc
mixin _$ConversationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState()';
}


}

/// @nodoc
class $ConversationsStateCopyWith<$Res>  {
$ConversationsStateCopyWith(ConversationsState _, $Res Function(ConversationsState) __);
}


/// Adds pattern-matching-related methods to [ConversationsState].
extension ConversationsStatePatterns on ConversationsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ConversationParams> conversations)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.conversations);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ConversationParams> conversations)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.conversations);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ConversationParams> conversations)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.conversations);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ConversationsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.initial()';
}


}




/// @nodoc


class Loading implements ConversationsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.loading()';
}


}




/// @nodoc


class Success implements ConversationsState {
  const Success(final  List<ConversationParams> conversations): _conversations = conversations;
  

 final  List<ConversationParams> _conversations;
 List<ConversationParams> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'ConversationsState.success(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<ConversationParams> conversations
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(Success(
null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationParams>,
  ));
}


}

/// @nodoc


class Error implements ConversationsState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of ConversationsState
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
  return 'ConversationsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
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

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
