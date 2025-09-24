// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateChatParams {

 String get firstUserId; String get secondUserId; String get firstUserName; String get secondUserName; String? get firstUserAvatar; String? get secondUserAvatar;
/// Create a copy of CreateChatParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChatParamsCopyWith<CreateChatParams> get copyWith => _$CreateChatParamsCopyWithImpl<CreateChatParams>(this as CreateChatParams, _$identity);

  /// Serializes this CreateChatParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChatParams&&(identical(other.firstUserId, firstUserId) || other.firstUserId == firstUserId)&&(identical(other.secondUserId, secondUserId) || other.secondUserId == secondUserId)&&(identical(other.firstUserName, firstUserName) || other.firstUserName == firstUserName)&&(identical(other.secondUserName, secondUserName) || other.secondUserName == secondUserName)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstUserId,secondUserId,firstUserName,secondUserName,firstUserAvatar,secondUserAvatar);

@override
String toString() {
  return 'CreateChatParams(firstUserId: $firstUserId, secondUserId: $secondUserId, firstUserName: $firstUserName, secondUserName: $secondUserName, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar)';
}


}

/// @nodoc
abstract mixin class $CreateChatParamsCopyWith<$Res>  {
  factory $CreateChatParamsCopyWith(CreateChatParams value, $Res Function(CreateChatParams) _then) = _$CreateChatParamsCopyWithImpl;
@useResult
$Res call({
 String firstUserId, String secondUserId, String firstUserName, String secondUserName, String? firstUserAvatar, String? secondUserAvatar
});




}
/// @nodoc
class _$CreateChatParamsCopyWithImpl<$Res>
    implements $CreateChatParamsCopyWith<$Res> {
  _$CreateChatParamsCopyWithImpl(this._self, this._then);

  final CreateChatParams _self;
  final $Res Function(CreateChatParams) _then;

/// Create a copy of CreateChatParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstUserId = null,Object? secondUserId = null,Object? firstUserName = null,Object? secondUserName = null,Object? firstUserAvatar = freezed,Object? secondUserAvatar = freezed,}) {
  return _then(_self.copyWith(
firstUserId: null == firstUserId ? _self.firstUserId : firstUserId // ignore: cast_nullable_to_non_nullable
as String,secondUserId: null == secondUserId ? _self.secondUserId : secondUserId // ignore: cast_nullable_to_non_nullable
as String,firstUserName: null == firstUserName ? _self.firstUserName : firstUserName // ignore: cast_nullable_to_non_nullable
as String,secondUserName: null == secondUserName ? _self.secondUserName : secondUserName // ignore: cast_nullable_to_non_nullable
as String,firstUserAvatar: freezed == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,secondUserAvatar: freezed == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateChatParams].
extension CreateChatParamsPatterns on CreateChatParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateChatParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateChatParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateChatParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateChatParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateChatParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateChatParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstUserId,  String secondUserId,  String firstUserName,  String secondUserName,  String? firstUserAvatar,  String? secondUserAvatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateChatParams() when $default != null:
return $default(_that.firstUserId,_that.secondUserId,_that.firstUserName,_that.secondUserName,_that.firstUserAvatar,_that.secondUserAvatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstUserId,  String secondUserId,  String firstUserName,  String secondUserName,  String? firstUserAvatar,  String? secondUserAvatar)  $default,) {final _that = this;
switch (_that) {
case _CreateChatParams():
return $default(_that.firstUserId,_that.secondUserId,_that.firstUserName,_that.secondUserName,_that.firstUserAvatar,_that.secondUserAvatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstUserId,  String secondUserId,  String firstUserName,  String secondUserName,  String? firstUserAvatar,  String? secondUserAvatar)?  $default,) {final _that = this;
switch (_that) {
case _CreateChatParams() when $default != null:
return $default(_that.firstUserId,_that.secondUserId,_that.firstUserName,_that.secondUserName,_that.firstUserAvatar,_that.secondUserAvatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateChatParams implements CreateChatParams {
  const _CreateChatParams({required this.firstUserId, required this.secondUserId, required this.firstUserName, required this.secondUserName, this.firstUserAvatar, this.secondUserAvatar});
  factory _CreateChatParams.fromJson(Map<String, dynamic> json) => _$CreateChatParamsFromJson(json);

@override final  String firstUserId;
@override final  String secondUserId;
@override final  String firstUserName;
@override final  String secondUserName;
@override final  String? firstUserAvatar;
@override final  String? secondUserAvatar;

/// Create a copy of CreateChatParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChatParamsCopyWith<_CreateChatParams> get copyWith => __$CreateChatParamsCopyWithImpl<_CreateChatParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateChatParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChatParams&&(identical(other.firstUserId, firstUserId) || other.firstUserId == firstUserId)&&(identical(other.secondUserId, secondUserId) || other.secondUserId == secondUserId)&&(identical(other.firstUserName, firstUserName) || other.firstUserName == firstUserName)&&(identical(other.secondUserName, secondUserName) || other.secondUserName == secondUserName)&&(identical(other.firstUserAvatar, firstUserAvatar) || other.firstUserAvatar == firstUserAvatar)&&(identical(other.secondUserAvatar, secondUserAvatar) || other.secondUserAvatar == secondUserAvatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstUserId,secondUserId,firstUserName,secondUserName,firstUserAvatar,secondUserAvatar);

@override
String toString() {
  return 'CreateChatParams(firstUserId: $firstUserId, secondUserId: $secondUserId, firstUserName: $firstUserName, secondUserName: $secondUserName, firstUserAvatar: $firstUserAvatar, secondUserAvatar: $secondUserAvatar)';
}


}

/// @nodoc
abstract mixin class _$CreateChatParamsCopyWith<$Res> implements $CreateChatParamsCopyWith<$Res> {
  factory _$CreateChatParamsCopyWith(_CreateChatParams value, $Res Function(_CreateChatParams) _then) = __$CreateChatParamsCopyWithImpl;
@override @useResult
$Res call({
 String firstUserId, String secondUserId, String firstUserName, String secondUserName, String? firstUserAvatar, String? secondUserAvatar
});




}
/// @nodoc
class __$CreateChatParamsCopyWithImpl<$Res>
    implements _$CreateChatParamsCopyWith<$Res> {
  __$CreateChatParamsCopyWithImpl(this._self, this._then);

  final _CreateChatParams _self;
  final $Res Function(_CreateChatParams) _then;

/// Create a copy of CreateChatParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstUserId = null,Object? secondUserId = null,Object? firstUserName = null,Object? secondUserName = null,Object? firstUserAvatar = freezed,Object? secondUserAvatar = freezed,}) {
  return _then(_CreateChatParams(
firstUserId: null == firstUserId ? _self.firstUserId : firstUserId // ignore: cast_nullable_to_non_nullable
as String,secondUserId: null == secondUserId ? _self.secondUserId : secondUserId // ignore: cast_nullable_to_non_nullable
as String,firstUserName: null == firstUserName ? _self.firstUserName : firstUserName // ignore: cast_nullable_to_non_nullable
as String,secondUserName: null == secondUserName ? _self.secondUserName : secondUserName // ignore: cast_nullable_to_non_nullable
as String,firstUserAvatar: freezed == firstUserAvatar ? _self.firstUserAvatar : firstUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,secondUserAvatar: freezed == secondUserAvatar ? _self.secondUserAvatar : secondUserAvatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
