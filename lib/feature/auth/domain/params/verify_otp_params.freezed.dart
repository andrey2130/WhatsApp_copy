// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtpParams {

 String get phoneNumber; String get otpCode; String get verificationId;
/// Create a copy of VerifyOtpParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpParamsCopyWith<VerifyOtpParams> get copyWith => _$VerifyOtpParamsCopyWithImpl<VerifyOtpParams>(this as VerifyOtpParams, _$identity);

  /// Serializes this VerifyOtpParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpParams&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpCode,verificationId);

@override
String toString() {
  return 'VerifyOtpParams(phoneNumber: $phoneNumber, otpCode: $otpCode, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpParamsCopyWith<$Res>  {
  factory $VerifyOtpParamsCopyWith(VerifyOtpParams value, $Res Function(VerifyOtpParams) _then) = _$VerifyOtpParamsCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String otpCode, String verificationId
});




}
/// @nodoc
class _$VerifyOtpParamsCopyWithImpl<$Res>
    implements $VerifyOtpParamsCopyWith<$Res> {
  _$VerifyOtpParamsCopyWithImpl(this._self, this._then);

  final VerifyOtpParams _self;
  final $Res Function(VerifyOtpParams) _then;

/// Create a copy of VerifyOtpParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? otpCode = null,Object? verificationId = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpParams].
extension VerifyOtpParamsPatterns on VerifyOtpParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpParams value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpParams value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String otpCode,  String verificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpParams() when $default != null:
return $default(_that.phoneNumber,_that.otpCode,_that.verificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String otpCode,  String verificationId)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpParams():
return $default(_that.phoneNumber,_that.otpCode,_that.verificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String otpCode,  String verificationId)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpParams() when $default != null:
return $default(_that.phoneNumber,_that.otpCode,_that.verificationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpParams implements VerifyOtpParams {
  const _VerifyOtpParams({required this.phoneNumber, required this.otpCode, required this.verificationId});
  factory _VerifyOtpParams.fromJson(Map<String, dynamic> json) => _$VerifyOtpParamsFromJson(json);

@override final  String phoneNumber;
@override final  String otpCode;
@override final  String verificationId;

/// Create a copy of VerifyOtpParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpParamsCopyWith<_VerifyOtpParams> get copyWith => __$VerifyOtpParamsCopyWithImpl<_VerifyOtpParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpParams&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpCode,verificationId);

@override
String toString() {
  return 'VerifyOtpParams(phoneNumber: $phoneNumber, otpCode: $otpCode, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpParamsCopyWith<$Res> implements $VerifyOtpParamsCopyWith<$Res> {
  factory _$VerifyOtpParamsCopyWith(_VerifyOtpParams value, $Res Function(_VerifyOtpParams) _then) = __$VerifyOtpParamsCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String otpCode, String verificationId
});




}
/// @nodoc
class __$VerifyOtpParamsCopyWithImpl<$Res>
    implements _$VerifyOtpParamsCopyWith<$Res> {
  __$VerifyOtpParamsCopyWithImpl(this._self, this._then);

  final _VerifyOtpParams _self;
  final $Res Function(_VerifyOtpParams) _then;

/// Create a copy of VerifyOtpParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otpCode = null,Object? verificationId = null,}) {
  return _then(_VerifyOtpParams(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
