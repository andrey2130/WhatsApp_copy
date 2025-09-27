// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageParams {

 String get id; String get chatId; String get senderId; String get receiverId; String get senderName; String get receiverName; String get message; String get createdAt; String get updatedAt; String get firstUserAvatar; String get secondUserAvatar; String? get replyToMessageId; String? get replyText; String? get imageUrl; bool get isRead;
/// Create a copy of MessageParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageParamsCopyWith<MessageParams> get copyWith => _$MessageParamsCopyWithImpl<MessageParams>(this as MessageParams, _$identity);

  /// Serializes this MessageParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageParams&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar)&&(identical(other.replyToMessageId, replyToMessageId) || other.replyToMessageId == replyToMessageId)&&(identical(other.replyText, replyText) || other.replyText == replyText)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,receiverId,senderName,receiverName,message,createdAt,updatedAt,firstUserAvatar,secondUserAvatar,replyToMessageId,replyText,imageUrl,isRead);

@override
String toString() {
  return 'MessageParams(id: $id, chatId: $chatId, senderId: $senderId, receiverId: $receiverId, senderName: $senderName, receiverName: $receiverName, message: $message, createdAt: $createdAt, updatedAt: $updatedAt, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar, replyToMessageId: $replyToMessageId, replyText: $replyText, imageUrl: $imageUrl, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class $MessageParamsCopyWith<$Res>  {
  factory $MessageParamsCopyWith(MessageParams value, $Res Function(MessageParams) _then) = _$MessageParamsCopyWithImpl;
@useResult
$Res call({
 String id, String chatId, String senderId, String receiverId, String senderName, String receiverName, String message, String createdAt, String updatedAt, String firstUserAvatar, String secondUserAvatar, String? replyToMessageId, String? replyText, String? imageUrl, bool isRead
});




}
/// @nodoc
class _$MessageParamsCopyWithImpl<$Res>
    implements $MessageParamsCopyWith<$Res> {
  _$MessageParamsCopyWithImpl(this._self, this._then);

  final MessageParams _self;
  final $Res Function(MessageParams) _then;

/// Create a copy of MessageParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? receiverId = null,Object? senderName = null,Object? receiverName = null,Object? message = null,Object? createdAt = null,Object? updatedAt = null,Object? firstUserAvatar = null,Object? secondUserAvatar = null,Object? replyToMessageId = freezed,Object? replyText = freezed,Object? imageUrl = freezed,Object? isRead = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,firstUserAvatar: null == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String,secondUserAvatar: null == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String,replyToMessageId: freezed == replyToMessageId ? _self.replyToMessageId : replyToMessageId // ignore: cast_nullable_to_non_nullable
as String?,replyText: freezed == replyText ? _self.replyText : replyText // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageParams].
extension MessageParamsPatterns on MessageParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageParams value)  $default,){
final _that = this;
switch (_that) {
case _MessageParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageParams value)?  $default,){
final _that = this;
switch (_that) {
case _MessageParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chatId,  String senderId,  String receiverId,  String senderName,  String receiverName,  String message,  String createdAt,  String updatedAt,  String firstUserAvatar,  String secondUserAvatar,  String? replyToMessageId,  String? replyText,  String? imageUrl,  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageParams() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.receiverId,_that.senderName,_that.receiverName,_that.message,_that.createdAt,_that.updatedAt,_that.firstUserAvatar,_that.secondUserAvatar,_that.replyToMessageId,_that.replyText,_that.imageUrl,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chatId,  String senderId,  String receiverId,  String senderName,  String receiverName,  String message,  String createdAt,  String updatedAt,  String firstUserAvatar,  String secondUserAvatar,  String? replyToMessageId,  String? replyText,  String? imageUrl,  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _MessageParams():
return $default(_that.id,_that.chatId,_that.senderId,_that.receiverId,_that.senderName,_that.receiverName,_that.message,_that.createdAt,_that.updatedAt,_that.firstUserAvatar,_that.secondUserAvatar,_that.replyToMessageId,_that.replyText,_that.imageUrl,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chatId,  String senderId,  String receiverId,  String senderName,  String receiverName,  String message,  String createdAt,  String updatedAt,  String firstUserAvatar,  String secondUserAvatar,  String? replyToMessageId,  String? replyText,  String? imageUrl,  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _MessageParams() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.receiverId,_that.senderName,_that.receiverName,_that.message,_that.createdAt,_that.updatedAt,_that.firstUserAvatar,_that.secondUserAvatar,_that.replyToMessageId,_that.replyText,_that.imageUrl,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageParams implements MessageParams {
  const _MessageParams({required this.id, required this.chatId, required this.senderId, required this.receiverId, required this.senderName, required this.receiverName, required this.message, required this.createdAt, required this.updatedAt, required this.firstUserAvatar, required this.secondUserAvatar, this.replyToMessageId, this.replyText, this.imageUrl, this.isRead = false});
  factory _MessageParams.fromJson(Map<String, dynamic> json) => _$MessageParamsFromJson(json);

@override final  String id;
@override final  String chatId;
@override final  String senderId;
@override final  String receiverId;
@override final  String senderName;
@override final  String receiverName;
@override final  String message;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String firstUserAvatar;
@override final  String secondUserAvatar;
@override final  String? replyToMessageId;
@override final  String? replyText;
@override final  String? imageUrl;
@override@JsonKey() final  bool isRead;

/// Create a copy of MessageParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageParamsCopyWith<_MessageParams> get copyWith => __$MessageParamsCopyWithImpl<_MessageParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageParams&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar)&&(identical(other.replyToMessageId, replyToMessageId) || other.replyToMessageId == replyToMessageId)&&(identical(other.replyText, replyText) || other.replyText == replyText)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,receiverId,senderName,receiverName,message,createdAt,updatedAt,firstUserAvatar,secondUserAvatar,replyToMessageId,replyText,imageUrl,isRead);

@override
String toString() {
  return 'MessageParams(id: $id, chatId: $chatId, senderId: $senderId, receiverId: $receiverId, senderName: $senderName, receiverName: $receiverName, message: $message, createdAt: $createdAt, updatedAt: $updatedAt, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar, replyToMessageId: $replyToMessageId, replyText: $replyText, imageUrl: $imageUrl, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$MessageParamsCopyWith<$Res> implements $MessageParamsCopyWith<$Res> {
  factory _$MessageParamsCopyWith(_MessageParams value, $Res Function(_MessageParams) _then) = __$MessageParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, String chatId, String senderId, String receiverId, String senderName, String receiverName, String message, String createdAt, String updatedAt, String firstUserAvatar, String secondUserAvatar, String? replyToMessageId, String? replyText, String? imageUrl, bool isRead
});




}
/// @nodoc
class __$MessageParamsCopyWithImpl<$Res>
    implements _$MessageParamsCopyWith<$Res> {
  __$MessageParamsCopyWithImpl(this._self, this._then);

  final _MessageParams _self;
  final $Res Function(_MessageParams) _then;

/// Create a copy of MessageParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? receiverId = null,Object? senderName = null,Object? receiverName = null,Object? message = null,Object? createdAt = null,Object? updatedAt = null,Object? firstUserAvatar = null,Object? secondUserAvatar = null,Object? replyToMessageId = freezed,Object? replyText = freezed,Object? imageUrl = freezed,Object? isRead = null,}) {
  return _then(_MessageParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,firstUserAvatar: null == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String,secondUserAvatar: null == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String,replyToMessageId: freezed == replyToMessageId ? _self.replyToMessageId : replyToMessageId // ignore: cast_nullable_to_non_nullable
as String?,replyText: freezed == replyText ? _self.replyText : replyText // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
