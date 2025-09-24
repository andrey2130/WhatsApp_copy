// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatParams {

 String get id; String get firstUserName; String get secondUserName; String get firstUserId; String get secondUserId; String get createdAt; String get updatedAt; String? get lastMessage; String? get firstUserAvatar; String? get secondUserAvatar; Map<String, int> get unreadCount;
/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatParamsCopyWith<ChatParams> get copyWith => _$ChatParamsCopyWithImpl<ChatParams>(this as ChatParams, _$identity);

  /// Serializes this ChatParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatParams&&(identical(other.id, id) || other.id == id)&&(identical(other.firstUserName, firstUserName) || other.firstUserName == firstUserName)&&(identical(other.secondUserName, secondUserName) || other.secondUserName == secondUserName)&&(identical(other.firstUserId, firstUserId) || other.firstUserId == firstUserId)&&(identical(other.secondUserId, secondUserId) || other.secondUserId == secondUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar)&&const DeepCollectionEquality().equals(other.unreadCount, unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstUserName,secondUserName,firstUserId,secondUserId,createdAt,updatedAt,lastMessage,firstUserAvatar,secondUserAvatar,const DeepCollectionEquality().hash(unreadCount));

@override
String toString() {
  return 'ChatParams(id: $id, firstUserName: $firstUserName, secondUserName: $secondUserName, firstUserId: $firstUserId, secondUserId: $secondUserId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessage: $lastMessage, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ChatParamsCopyWith<$Res>  {
  factory $ChatParamsCopyWith(ChatParams value, $Res Function(ChatParams) _then) = _$ChatParamsCopyWithImpl;
@useResult
$Res call({
 String id, String firstUserName, String secondUserName, String firstUserId, String secondUserId, String createdAt, String updatedAt, String? lastMessage, String? firstUserAvatar, String? secondUserAvatar, Map<String, int> unreadCount
});




}
/// @nodoc
class _$ChatParamsCopyWithImpl<$Res>
    implements $ChatParamsCopyWith<$Res> {
  _$ChatParamsCopyWithImpl(this._self, this._then);

  final ChatParams _self;
  final $Res Function(ChatParams) _then;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstUserName = null,Object? secondUserName = null,Object? firstUserId = null,Object? secondUserId = null,Object? createdAt = null,Object? updatedAt = null,Object? lastMessage = freezed,Object? firstUserAvatar = freezed,Object? secondUserAvatar = freezed,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstUserName: null == firstUserName ? _self.firstUserName : firstUserName // ignore: cast_nullable_to_non_nullable
as String,secondUserName: null == secondUserName ? _self.secondUserName : secondUserName // ignore: cast_nullable_to_non_nullable
as String,firstUserId: null == firstUserId ? _self.firstUserId : firstUserId // ignore: cast_nullable_to_non_nullable
as String,secondUserId: null == secondUserId ? _self.secondUserId : secondUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,firstUserAvatar: freezed == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,secondUserAvatar: freezed == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatParams].
extension ChatParamsPatterns on ChatParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatParams value)  $default,){
final _that = this;
switch (_that) {
case _ChatParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatParams value)?  $default,){
final _that = this;
switch (_that) {
case _ChatParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstUserName,  String secondUserName,  String firstUserId,  String secondUserId,  String createdAt,  String updatedAt,  String? lastMessage,  String? firstUserAvatar,  String? secondUserAvatar,  Map<String, int> unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatParams() when $default != null:
return $default(_that.id,_that.firstUserName,_that.secondUserName,_that.firstUserId,_that.secondUserId,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.firstUserAvatar,_that.secondUserAvatar,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstUserName,  String secondUserName,  String firstUserId,  String secondUserId,  String createdAt,  String updatedAt,  String? lastMessage,  String? firstUserAvatar,  String? secondUserAvatar,  Map<String, int> unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ChatParams():
return $default(_that.id,_that.firstUserName,_that.secondUserName,_that.firstUserId,_that.secondUserId,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.firstUserAvatar,_that.secondUserAvatar,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstUserName,  String secondUserName,  String firstUserId,  String secondUserId,  String createdAt,  String updatedAt,  String? lastMessage,  String? firstUserAvatar,  String? secondUserAvatar,  Map<String, int> unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatParams() when $default != null:
return $default(_that.id,_that.firstUserName,_that.secondUserName,_that.firstUserId,_that.secondUserId,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.firstUserAvatar,_that.secondUserAvatar,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatParams implements ChatParams {
  const _ChatParams({required this.id, required this.firstUserName, required this.secondUserName, required this.firstUserId, required this.secondUserId, required this.createdAt, required this.updatedAt, this.lastMessage, this.firstUserAvatar, this.secondUserAvatar, final  Map<String, int> unreadCount = const {}}): _unreadCount = unreadCount;
  factory _ChatParams.fromJson(Map<String, dynamic> json) => _$ChatParamsFromJson(json);

@override final  String id;
@override final  String firstUserName;
@override final  String secondUserName;
@override final  String firstUserId;
@override final  String secondUserId;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? lastMessage;
@override final  String? firstUserAvatar;
@override final  String? secondUserAvatar;
 final  Map<String, int> _unreadCount;
@override@JsonKey() Map<String, int> get unreadCount {
  if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_unreadCount);
}


/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatParamsCopyWith<_ChatParams> get copyWith => __$ChatParamsCopyWithImpl<_ChatParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatParams&&(identical(other.id, id) || other.id == id)&&(identical(other.firstUserName, firstUserName) || other.firstUserName == firstUserName)&&(identical(other.secondUserName, secondUserName) || other.secondUserName == secondUserName)&&(identical(other.firstUserId, firstUserId) || other.firstUserId == firstUserId)&&(identical(other.secondUserId, secondUserId) || other.secondUserId == secondUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar)&&const DeepCollectionEquality().equals(other._unreadCount, _unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstUserName,secondUserName,firstUserId,secondUserId,createdAt,updatedAt,lastMessage,firstUserAvatar,secondUserAvatar,const DeepCollectionEquality().hash(_unreadCount));

@override
String toString() {
  return 'ChatParams(id: $id, firstUserName: $firstUserName, secondUserName: $secondUserName, firstUserId: $firstUserId, secondUserId: $secondUserId, createdAt: $createdAt, updatedAt: $updatedAt, lastMessage: $lastMessage, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ChatParamsCopyWith<$Res> implements $ChatParamsCopyWith<$Res> {
  factory _$ChatParamsCopyWith(_ChatParams value, $Res Function(_ChatParams) _then) = __$ChatParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstUserName, String secondUserName, String firstUserId, String secondUserId, String createdAt, String updatedAt, String? lastMessage, String? firstUserAvatar, String? secondUserAvatar, Map<String, int> unreadCount
});




}
/// @nodoc
class __$ChatParamsCopyWithImpl<$Res>
    implements _$ChatParamsCopyWith<$Res> {
  __$ChatParamsCopyWithImpl(this._self, this._then);

  final _ChatParams _self;
  final $Res Function(_ChatParams) _then;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstUserName = null,Object? secondUserName = null,Object? firstUserId = null,Object? secondUserId = null,Object? createdAt = null,Object? updatedAt = null,Object? lastMessage = freezed,Object? firstUserAvatar = freezed,Object? secondUserAvatar = freezed,Object? unreadCount = null,}) {
  return _then(_ChatParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstUserName: null == firstUserName ? _self.firstUserName : firstUserName // ignore: cast_nullable_to_non_nullable
as String,secondUserName: null == secondUserName ? _self.secondUserName : secondUserName // ignore: cast_nullable_to_non_nullable
as String,firstUserId: null == firstUserId ? _self.firstUserId : firstUserId // ignore: cast_nullable_to_non_nullable
as String,secondUserId: null == secondUserId ? _self.secondUserId : secondUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,firstUserAvatar: freezed == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,secondUserAvatar: freezed == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,unreadCount: null == unreadCount ? _self._unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
