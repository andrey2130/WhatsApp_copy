// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationParams {

 String get id; String get title; bool get isGroup; List<String> get participantIds; String get creatorId; DateTime get createdAt; DateTime get updatedAt; String? get avatarUrl; String? get lastMessageId; String? get lastMessageText; String? get lastMessageSenderId; DateTime? get lastMessageAt; int get unreadCount; bool get isMuted; bool get isPinned; bool get isArchived;
/// Create a copy of ConversationParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationParamsCopyWith<ConversationParams> get copyWith => _$ConversationParamsCopyWithImpl<ConversationParams>(this as ConversationParams, _$identity);

  /// Serializes this ConversationParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationParams&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&const DeepCollectionEquality().equals(other.participantIds, participantIds)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isGroup,const DeepCollectionEquality().hash(participantIds),creatorId,createdAt,updatedAt,avatarUrl,lastMessageId,lastMessageText,lastMessageSenderId,lastMessageAt,unreadCount,isMuted,isPinned,isArchived);

@override
String toString() {
  return 'ConversationParams(id: $id, title: $title, isGroup: $isGroup, participantIds: $participantIds, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, avatarUrl: $avatarUrl, lastMessageId: $lastMessageId, lastMessageText: $lastMessageText, lastMessageSenderId: $lastMessageSenderId, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, isMuted: $isMuted, isPinned: $isPinned, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class $ConversationParamsCopyWith<$Res>  {
  factory $ConversationParamsCopyWith(ConversationParams value, $Res Function(ConversationParams) _then) = _$ConversationParamsCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isGroup, List<String> participantIds, String creatorId, DateTime createdAt, DateTime updatedAt, String? avatarUrl, String? lastMessageId, String? lastMessageText, String? lastMessageSenderId, DateTime? lastMessageAt, int unreadCount, bool isMuted, bool isPinned, bool isArchived
});




}
/// @nodoc
class _$ConversationParamsCopyWithImpl<$Res>
    implements $ConversationParamsCopyWith<$Res> {
  _$ConversationParamsCopyWithImpl(this._self, this._then);

  final ConversationParams _self;
  final $Res Function(ConversationParams) _then;

/// Create a copy of ConversationParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isGroup = null,Object? participantIds = null,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,Object? avatarUrl = freezed,Object? lastMessageId = freezed,Object? lastMessageText = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? isMuted = null,Object? isPinned = null,Object? isArchived = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,participantIds: null == participantIds ? _self.participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationParams].
extension ConversationParamsPatterns on ConversationParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationParams value)  $default,){
final _that = this;
switch (_that) {
case _ConversationParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationParams value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isGroup,  List<String> participantIds,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  String? avatarUrl,  String? lastMessageId,  String? lastMessageText,  String? lastMessageSenderId,  DateTime? lastMessageAt,  int unreadCount,  bool isMuted,  bool isPinned,  bool isArchived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationParams() when $default != null:
return $default(_that.id,_that.title,_that.isGroup,_that.participantIds,_that.creatorId,_that.createdAt,_that.updatedAt,_that.avatarUrl,_that.lastMessageId,_that.lastMessageText,_that.lastMessageSenderId,_that.lastMessageAt,_that.unreadCount,_that.isMuted,_that.isPinned,_that.isArchived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isGroup,  List<String> participantIds,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  String? avatarUrl,  String? lastMessageId,  String? lastMessageText,  String? lastMessageSenderId,  DateTime? lastMessageAt,  int unreadCount,  bool isMuted,  bool isPinned,  bool isArchived)  $default,) {final _that = this;
switch (_that) {
case _ConversationParams():
return $default(_that.id,_that.title,_that.isGroup,_that.participantIds,_that.creatorId,_that.createdAt,_that.updatedAt,_that.avatarUrl,_that.lastMessageId,_that.lastMessageText,_that.lastMessageSenderId,_that.lastMessageAt,_that.unreadCount,_that.isMuted,_that.isPinned,_that.isArchived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isGroup,  List<String> participantIds,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  String? avatarUrl,  String? lastMessageId,  String? lastMessageText,  String? lastMessageSenderId,  DateTime? lastMessageAt,  int unreadCount,  bool isMuted,  bool isPinned,  bool isArchived)?  $default,) {final _that = this;
switch (_that) {
case _ConversationParams() when $default != null:
return $default(_that.id,_that.title,_that.isGroup,_that.participantIds,_that.creatorId,_that.createdAt,_that.updatedAt,_that.avatarUrl,_that.lastMessageId,_that.lastMessageText,_that.lastMessageSenderId,_that.lastMessageAt,_that.unreadCount,_that.isMuted,_that.isPinned,_that.isArchived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationParams implements ConversationParams {
  const _ConversationParams({required this.id, required this.title, required this.isGroup, required final  List<String> participantIds, required this.creatorId, required this.createdAt, required this.updatedAt, this.avatarUrl, this.lastMessageId, this.lastMessageText, this.lastMessageSenderId, this.lastMessageAt, this.unreadCount = 0, this.isMuted = false, this.isPinned = false, this.isArchived = false}): _participantIds = participantIds;
  factory _ConversationParams.fromJson(Map<String, dynamic> json) => _$ConversationParamsFromJson(json);

@override final  String id;
@override final  String title;
@override final  bool isGroup;
 final  List<String> _participantIds;
@override List<String> get participantIds {
  if (_participantIds is EqualUnmodifiableListView) return _participantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantIds);
}

@override final  String creatorId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? avatarUrl;
@override final  String? lastMessageId;
@override final  String? lastMessageText;
@override final  String? lastMessageSenderId;
@override final  DateTime? lastMessageAt;
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isMuted;
@override@JsonKey() final  bool isPinned;
@override@JsonKey() final  bool isArchived;

/// Create a copy of ConversationParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationParamsCopyWith<_ConversationParams> get copyWith => __$ConversationParamsCopyWithImpl<_ConversationParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationParams&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&const DeepCollectionEquality().equals(other._participantIds, _participantIds)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isGroup,const DeepCollectionEquality().hash(_participantIds),creatorId,createdAt,updatedAt,avatarUrl,lastMessageId,lastMessageText,lastMessageSenderId,lastMessageAt,unreadCount,isMuted,isPinned,isArchived);

@override
String toString() {
  return 'ConversationParams(id: $id, title: $title, isGroup: $isGroup, participantIds: $participantIds, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, avatarUrl: $avatarUrl, lastMessageId: $lastMessageId, lastMessageText: $lastMessageText, lastMessageSenderId: $lastMessageSenderId, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, isMuted: $isMuted, isPinned: $isPinned, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class _$ConversationParamsCopyWith<$Res> implements $ConversationParamsCopyWith<$Res> {
  factory _$ConversationParamsCopyWith(_ConversationParams value, $Res Function(_ConversationParams) _then) = __$ConversationParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isGroup, List<String> participantIds, String creatorId, DateTime createdAt, DateTime updatedAt, String? avatarUrl, String? lastMessageId, String? lastMessageText, String? lastMessageSenderId, DateTime? lastMessageAt, int unreadCount, bool isMuted, bool isPinned, bool isArchived
});




}
/// @nodoc
class __$ConversationParamsCopyWithImpl<$Res>
    implements _$ConversationParamsCopyWith<$Res> {
  __$ConversationParamsCopyWithImpl(this._self, this._then);

  final _ConversationParams _self;
  final $Res Function(_ConversationParams) _then;

/// Create a copy of ConversationParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isGroup = null,Object? participantIds = null,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,Object? avatarUrl = freezed,Object? lastMessageId = freezed,Object? lastMessageText = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? isMuted = null,Object? isPinned = null,Object? isArchived = null,}) {
  return _then(_ConversationParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,participantIds: null == participantIds ? _self._participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
