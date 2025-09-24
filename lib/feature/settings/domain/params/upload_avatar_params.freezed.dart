// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_avatar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadAvatarParams {

 String get userId; String get filePath;
/// Create a copy of UploadAvatarParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadAvatarParamsCopyWith<UploadAvatarParams> get copyWith => _$UploadAvatarParamsCopyWithImpl<UploadAvatarParams>(this as UploadAvatarParams, _$identity);

  /// Serializes this UploadAvatarParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadAvatarParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,filePath);

@override
String toString() {
  return 'UploadAvatarParams(userId: $userId, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $UploadAvatarParamsCopyWith<$Res>  {
  factory $UploadAvatarParamsCopyWith(UploadAvatarParams value, $Res Function(UploadAvatarParams) _then) = _$UploadAvatarParamsCopyWithImpl;
@useResult
$Res call({
 String userId, String filePath
});




}
/// @nodoc
class _$UploadAvatarParamsCopyWithImpl<$Res>
    implements $UploadAvatarParamsCopyWith<$Res> {
  _$UploadAvatarParamsCopyWithImpl(this._self, this._then);

  final UploadAvatarParams _self;
  final $Res Function(UploadAvatarParams) _then;

/// Create a copy of UploadAvatarParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? filePath = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadAvatarParams].
extension UploadAvatarParamsPatterns on UploadAvatarParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadAvatarParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadAvatarParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadAvatarParams value)  $default,){
final _that = this;
switch (_that) {
case _UploadAvatarParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadAvatarParams value)?  $default,){
final _that = this;
switch (_that) {
case _UploadAvatarParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String filePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadAvatarParams() when $default != null:
return $default(_that.userId,_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String filePath)  $default,) {final _that = this;
switch (_that) {
case _UploadAvatarParams():
return $default(_that.userId,_that.filePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String filePath)?  $default,) {final _that = this;
switch (_that) {
case _UploadAvatarParams() when $default != null:
return $default(_that.userId,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadAvatarParams implements UploadAvatarParams {
  const _UploadAvatarParams({required this.userId, required this.filePath});
  factory _UploadAvatarParams.fromJson(Map<String, dynamic> json) => _$UploadAvatarParamsFromJson(json);

@override final  String userId;
@override final  String filePath;

/// Create a copy of UploadAvatarParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadAvatarParamsCopyWith<_UploadAvatarParams> get copyWith => __$UploadAvatarParamsCopyWithImpl<_UploadAvatarParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadAvatarParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadAvatarParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,filePath);

@override
String toString() {
  return 'UploadAvatarParams(userId: $userId, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$UploadAvatarParamsCopyWith<$Res> implements $UploadAvatarParamsCopyWith<$Res> {
  factory _$UploadAvatarParamsCopyWith(_UploadAvatarParams value, $Res Function(_UploadAvatarParams) _then) = __$UploadAvatarParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String filePath
});




}
/// @nodoc
class __$UploadAvatarParamsCopyWithImpl<$Res>
    implements _$UploadAvatarParamsCopyWith<$Res> {
  __$UploadAvatarParamsCopyWithImpl(this._self, this._then);

  final _UploadAvatarParams _self;
  final $Res Function(_UploadAvatarParams) _then;

/// Create a copy of UploadAvatarParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? filePath = null,}) {
  return _then(_UploadAvatarParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
