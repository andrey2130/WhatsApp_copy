// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_via_phone_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginViaPhoneParams {

 String get phoneNumber; String get otpCode; String get bio;
/// Create a copy of LoginViaPhoneParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginViaPhoneParamsCopyWith<LoginViaPhoneParams> get copyWith => _$LoginViaPhoneParamsCopyWithImpl<LoginViaPhoneParams>(this as LoginViaPhoneParams, _$identity);

  /// Serializes this LoginViaPhoneParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginViaPhoneParams&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpCode,bio);

@override
String toString() {
  return 'LoginViaPhoneParams(phoneNumber: $phoneNumber, otpCode: $otpCode, bio: $bio)';
}


}

/// @nodoc
abstract mixin class $LoginViaPhoneParamsCopyWith<$Res>  {
  factory $LoginViaPhoneParamsCopyWith(LoginViaPhoneParams value, $Res Function(LoginViaPhoneParams) _then) = _$LoginViaPhoneParamsCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String otpCode, String bio
});




}
/// @nodoc
class _$LoginViaPhoneParamsCopyWithImpl<$Res>
    implements $LoginViaPhoneParamsCopyWith<$Res> {
  _$LoginViaPhoneParamsCopyWithImpl(this._self, this._then);

  final LoginViaPhoneParams _self;
  final $Res Function(LoginViaPhoneParams) _then;

/// Create a copy of LoginViaPhoneParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? otpCode = null,Object? bio = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginViaPhoneParams].
extension LoginViaPhoneParamsPatterns on LoginViaPhoneParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginViaPhoneParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginViaPhoneParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginViaPhoneParams value)  $default,){
final _that = this;
switch (_that) {
case _LoginViaPhoneParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginViaPhoneParams value)?  $default,){
final _that = this;
switch (_that) {
case _LoginViaPhoneParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String otpCode,  String bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginViaPhoneParams() when $default != null:
return $default(_that.phoneNumber,_that.otpCode,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String otpCode,  String bio)  $default,) {final _that = this;
switch (_that) {
case _LoginViaPhoneParams():
return $default(_that.phoneNumber,_that.otpCode,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String otpCode,  String bio)?  $default,) {final _that = this;
switch (_that) {
case _LoginViaPhoneParams() when $default != null:
return $default(_that.phoneNumber,_that.otpCode,_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginViaPhoneParams implements LoginViaPhoneParams {
  const _LoginViaPhoneParams({required this.phoneNumber, required this.otpCode, this.bio = 'Hey there! I am using WhatsApp.'});
  factory _LoginViaPhoneParams.fromJson(Map<String, dynamic> json) => _$LoginViaPhoneParamsFromJson(json);

@override final  String phoneNumber;
@override final  String otpCode;
@override@JsonKey() final  String bio;

/// Create a copy of LoginViaPhoneParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginViaPhoneParamsCopyWith<_LoginViaPhoneParams> get copyWith => __$LoginViaPhoneParamsCopyWithImpl<_LoginViaPhoneParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginViaPhoneParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginViaPhoneParams&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpCode,bio);

@override
String toString() {
  return 'LoginViaPhoneParams(phoneNumber: $phoneNumber, otpCode: $otpCode, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$LoginViaPhoneParamsCopyWith<$Res> implements $LoginViaPhoneParamsCopyWith<$Res> {
  factory _$LoginViaPhoneParamsCopyWith(_LoginViaPhoneParams value, $Res Function(_LoginViaPhoneParams) _then) = __$LoginViaPhoneParamsCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String otpCode, String bio
});




}
/// @nodoc
class __$LoginViaPhoneParamsCopyWithImpl<$Res>
    implements _$LoginViaPhoneParamsCopyWith<$Res> {
  __$LoginViaPhoneParamsCopyWithImpl(this._self, this._then);

  final _LoginViaPhoneParams _self;
  final $Res Function(_LoginViaPhoneParams) _then;

/// Create a copy of LoginViaPhoneParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otpCode = null,Object? bio = null,}) {
  return _then(_LoginViaPhoneParams(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
