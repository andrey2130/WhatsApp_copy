// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent()';
}


}

/// @nodoc
class $AuthBlocEventCopyWith<$Res>  {
$AuthBlocEventCopyWith(AuthBlocEvent _, $Res Function(AuthBlocEvent) __);
}


/// Adds pattern-matching-related methods to [AuthBlocEvent].
extension AuthBlocEventPatterns on AuthBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendOtp value)?  sendOtp,TResult Function( VerifyOtp value)?  verifyOtp,TResult Function( ResendOtp value)?  resendOtp,TResult Function( LoginViaEmail value)?  loginViaEmail,TResult Function( RegisterViaEmail value)?  registerViaEmail,TResult Function( CheckAuthStatus value)?  checkAuthStatus,TResult Function( LogOut value)?  logOut,TResult Function( AuthStateChanged value)?  authStateChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendOtp() when sendOtp != null:
return sendOtp(_that);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case ResendOtp() when resendOtp != null:
return resendOtp(_that);case LoginViaEmail() when loginViaEmail != null:
return loginViaEmail(_that);case RegisterViaEmail() when registerViaEmail != null:
return registerViaEmail(_that);case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case LogOut() when logOut != null:
return logOut(_that);case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendOtp value)  sendOtp,required TResult Function( VerifyOtp value)  verifyOtp,required TResult Function( ResendOtp value)  resendOtp,required TResult Function( LoginViaEmail value)  loginViaEmail,required TResult Function( RegisterViaEmail value)  registerViaEmail,required TResult Function( CheckAuthStatus value)  checkAuthStatus,required TResult Function( LogOut value)  logOut,required TResult Function( AuthStateChanged value)  authStateChanged,}){
final _that = this;
switch (_that) {
case SendOtp():
return sendOtp(_that);case VerifyOtp():
return verifyOtp(_that);case ResendOtp():
return resendOtp(_that);case LoginViaEmail():
return loginViaEmail(_that);case RegisterViaEmail():
return registerViaEmail(_that);case CheckAuthStatus():
return checkAuthStatus(_that);case LogOut():
return logOut(_that);case AuthStateChanged():
return authStateChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendOtp value)?  sendOtp,TResult? Function( VerifyOtp value)?  verifyOtp,TResult? Function( ResendOtp value)?  resendOtp,TResult? Function( LoginViaEmail value)?  loginViaEmail,TResult? Function( RegisterViaEmail value)?  registerViaEmail,TResult? Function( CheckAuthStatus value)?  checkAuthStatus,TResult? Function( LogOut value)?  logOut,TResult? Function( AuthStateChanged value)?  authStateChanged,}){
final _that = this;
switch (_that) {
case SendOtp() when sendOtp != null:
return sendOtp(_that);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case ResendOtp() when resendOtp != null:
return resendOtp(_that);case LoginViaEmail() when loginViaEmail != null:
return loginViaEmail(_that);case RegisterViaEmail() when registerViaEmail != null:
return registerViaEmail(_that);case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case LogOut() when logOut != null:
return logOut(_that);case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SendOtpParams params)?  sendOtp,TResult Function( VerifyOtpParams params)?  verifyOtp,TResult Function( SendOtpParams params)?  resendOtp,TResult Function( LoginParams params)?  loginViaEmail,TResult Function( RegisterParams params)?  registerViaEmail,TResult Function()?  checkAuthStatus,TResult Function()?  logOut,TResult Function( String? userId)?  authStateChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendOtp() when sendOtp != null:
return sendOtp(_that.params);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.params);case ResendOtp() when resendOtp != null:
return resendOtp(_that.params);case LoginViaEmail() when loginViaEmail != null:
return loginViaEmail(_that.params);case RegisterViaEmail() when registerViaEmail != null:
return registerViaEmail(_that.params);case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case LogOut() when logOut != null:
return logOut();case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SendOtpParams params)  sendOtp,required TResult Function( VerifyOtpParams params)  verifyOtp,required TResult Function( SendOtpParams params)  resendOtp,required TResult Function( LoginParams params)  loginViaEmail,required TResult Function( RegisterParams params)  registerViaEmail,required TResult Function()  checkAuthStatus,required TResult Function()  logOut,required TResult Function( String? userId)  authStateChanged,}) {final _that = this;
switch (_that) {
case SendOtp():
return sendOtp(_that.params);case VerifyOtp():
return verifyOtp(_that.params);case ResendOtp():
return resendOtp(_that.params);case LoginViaEmail():
return loginViaEmail(_that.params);case RegisterViaEmail():
return registerViaEmail(_that.params);case CheckAuthStatus():
return checkAuthStatus();case LogOut():
return logOut();case AuthStateChanged():
return authStateChanged(_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SendOtpParams params)?  sendOtp,TResult? Function( VerifyOtpParams params)?  verifyOtp,TResult? Function( SendOtpParams params)?  resendOtp,TResult? Function( LoginParams params)?  loginViaEmail,TResult? Function( RegisterParams params)?  registerViaEmail,TResult? Function()?  checkAuthStatus,TResult? Function()?  logOut,TResult? Function( String? userId)?  authStateChanged,}) {final _that = this;
switch (_that) {
case SendOtp() when sendOtp != null:
return sendOtp(_that.params);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.params);case ResendOtp() when resendOtp != null:
return resendOtp(_that.params);case LoginViaEmail() when loginViaEmail != null:
return loginViaEmail(_that.params);case RegisterViaEmail() when registerViaEmail != null:
return registerViaEmail(_that.params);case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case LogOut() when logOut != null:
return logOut();case AuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class SendOtp implements AuthBlocEvent {
  const SendOtp({required this.params});
  

 final  SendOtpParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpCopyWith<SendOtp> get copyWith => _$SendOtpCopyWithImpl<SendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtp&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.sendOtp(params: $params)';
}


}

/// @nodoc
abstract mixin class $SendOtpCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $SendOtpCopyWith(SendOtp value, $Res Function(SendOtp) _then) = _$SendOtpCopyWithImpl;
@useResult
$Res call({
 SendOtpParams params
});


$SendOtpParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$SendOtpCopyWithImpl<$Res>
    implements $SendOtpCopyWith<$Res> {
  _$SendOtpCopyWithImpl(this._self, this._then);

  final SendOtp _self;
  final $Res Function(SendOtp) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(SendOtp(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SendOtpParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendOtpParamsCopyWith<$Res> get params {
  
  return $SendOtpParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class VerifyOtp implements AuthBlocEvent {
  const VerifyOtp({required this.params});
  

 final  VerifyOtpParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpCopyWith<VerifyOtp> get copyWith => _$VerifyOtpCopyWithImpl<VerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtp&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.verifyOtp(params: $params)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $VerifyOtpCopyWith(VerifyOtp value, $Res Function(VerifyOtp) _then) = _$VerifyOtpCopyWithImpl;
@useResult
$Res call({
 VerifyOtpParams params
});


$VerifyOtpParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$VerifyOtpCopyWithImpl<$Res>
    implements $VerifyOtpCopyWith<$Res> {
  _$VerifyOtpCopyWithImpl(this._self, this._then);

  final VerifyOtp _self;
  final $Res Function(VerifyOtp) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(VerifyOtp(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as VerifyOtpParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpParamsCopyWith<$Res> get params {
  
  return $VerifyOtpParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class ResendOtp implements AuthBlocEvent {
  const ResendOtp({required this.params});
  

 final  SendOtpParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendOtpCopyWith<ResendOtp> get copyWith => _$ResendOtpCopyWithImpl<ResendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtp&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.resendOtp(params: $params)';
}


}

/// @nodoc
abstract mixin class $ResendOtpCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $ResendOtpCopyWith(ResendOtp value, $Res Function(ResendOtp) _then) = _$ResendOtpCopyWithImpl;
@useResult
$Res call({
 SendOtpParams params
});


$SendOtpParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$ResendOtpCopyWithImpl<$Res>
    implements $ResendOtpCopyWith<$Res> {
  _$ResendOtpCopyWithImpl(this._self, this._then);

  final ResendOtp _self;
  final $Res Function(ResendOtp) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(ResendOtp(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SendOtpParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendOtpParamsCopyWith<$Res> get params {
  
  return $SendOtpParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class LoginViaEmail implements AuthBlocEvent {
  const LoginViaEmail({required this.params});
  

 final  LoginParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginViaEmailCopyWith<LoginViaEmail> get copyWith => _$LoginViaEmailCopyWithImpl<LoginViaEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginViaEmail&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.loginViaEmail(params: $params)';
}


}

/// @nodoc
abstract mixin class $LoginViaEmailCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $LoginViaEmailCopyWith(LoginViaEmail value, $Res Function(LoginViaEmail) _then) = _$LoginViaEmailCopyWithImpl;
@useResult
$Res call({
 LoginParams params
});


$LoginParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$LoginViaEmailCopyWithImpl<$Res>
    implements $LoginViaEmailCopyWith<$Res> {
  _$LoginViaEmailCopyWithImpl(this._self, this._then);

  final LoginViaEmail _self;
  final $Res Function(LoginViaEmail) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(LoginViaEmail(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as LoginParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginParamsCopyWith<$Res> get params {
  
  return $LoginParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class RegisterViaEmail implements AuthBlocEvent {
  const RegisterViaEmail({required this.params});
  

 final  RegisterParams params;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterViaEmailCopyWith<RegisterViaEmail> get copyWith => _$RegisterViaEmailCopyWithImpl<RegisterViaEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterViaEmail&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthBlocEvent.registerViaEmail(params: $params)';
}


}

/// @nodoc
abstract mixin class $RegisterViaEmailCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $RegisterViaEmailCopyWith(RegisterViaEmail value, $Res Function(RegisterViaEmail) _then) = _$RegisterViaEmailCopyWithImpl;
@useResult
$Res call({
 RegisterParams params
});


$RegisterParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$RegisterViaEmailCopyWithImpl<$Res>
    implements $RegisterViaEmailCopyWith<$Res> {
  _$RegisterViaEmailCopyWithImpl(this._self, this._then);

  final RegisterViaEmail _self;
  final $Res Function(RegisterViaEmail) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(RegisterViaEmail(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as RegisterParams,
  ));
}

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterParamsCopyWith<$Res> get params {
  
  return $RegisterParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class CheckAuthStatus implements AuthBlocEvent {
  const CheckAuthStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent.checkAuthStatus()';
}


}




/// @nodoc


class LogOut implements AuthBlocEvent {
  const LogOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocEvent.logOut()';
}


}




/// @nodoc


class AuthStateChanged implements AuthBlocEvent {
  const AuthStateChanged({required this.userId});
  

 final  String? userId;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateChangedCopyWith<AuthStateChanged> get copyWith => _$AuthStateChangedCopyWithImpl<AuthStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateChanged&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AuthBlocEvent.authStateChanged(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AuthStateChangedCopyWith<$Res> implements $AuthBlocEventCopyWith<$Res> {
  factory $AuthStateChangedCopyWith(AuthStateChanged value, $Res Function(AuthStateChanged) _then) = _$AuthStateChangedCopyWithImpl;
@useResult
$Res call({
 String? userId
});




}
/// @nodoc
class _$AuthStateChangedCopyWithImpl<$Res>
    implements $AuthStateChangedCopyWith<$Res> {
  _$AuthStateChangedCopyWithImpl(this._self, this._then);

  final AuthStateChanged _self;
  final $Res Function(AuthStateChanged) _then;

/// Create a copy of AuthBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(AuthStateChanged(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$AuthBlocState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBlocState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState()';
}


}

/// @nodoc
class $AuthBlocStateCopyWith<$Res>  {
$AuthBlocStateCopyWith(AuthBlocState _, $Res Function(AuthBlocState) __);
}


/// Adds pattern-matching-related methods to [AuthBlocState].
extension AuthBlocStatePatterns on AuthBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( OtpSent value)?  otpSent,TResult Function( OtpVerified value)?  otpVerified,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( Authenticated value)?  authenticated,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case OtpSent() when otpSent != null:
return otpSent(_that);case OtpVerified() when otpVerified != null:
return otpVerified(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( OtpSent value)  otpSent,required TResult Function( OtpVerified value)  otpVerified,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( Authenticated value)  authenticated,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case OtpSent():
return otpSent(_that);case OtpVerified():
return otpVerified(_that);case Unauthenticated():
return unauthenticated(_that);case Authenticated():
return authenticated(_that);case Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( OtpSent value)?  otpSent,TResult? Function( OtpVerified value)?  otpVerified,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case OtpSent() when otpSent != null:
return otpSent(_that);case OtpVerified() when otpVerified != null:
return otpVerified(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String phoneNumber,  String verificationId)?  otpSent,TResult Function()?  otpVerified,TResult Function()?  unauthenticated,TResult Function( String userId)?  authenticated,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case OtpSent() when otpSent != null:
return otpSent(_that.phoneNumber,_that.verificationId);case OtpVerified() when otpVerified != null:
return otpVerified();case Unauthenticated() when unauthenticated != null:
return unauthenticated();case Authenticated() when authenticated != null:
return authenticated(_that.userId);case Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String phoneNumber,  String verificationId)  otpSent,required TResult Function()  otpVerified,required TResult Function()  unauthenticated,required TResult Function( String userId)  authenticated,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case OtpSent():
return otpSent(_that.phoneNumber,_that.verificationId);case OtpVerified():
return otpVerified();case Unauthenticated():
return unauthenticated();case Authenticated():
return authenticated(_that.userId);case Failure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String phoneNumber,  String verificationId)?  otpSent,TResult? Function()?  otpVerified,TResult? Function()?  unauthenticated,TResult? Function( String userId)?  authenticated,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case OtpSent() when otpSent != null:
return otpSent(_that.phoneNumber,_that.verificationId);case OtpVerified() when otpVerified != null:
return otpVerified();case Unauthenticated() when unauthenticated != null:
return unauthenticated();case Authenticated() when authenticated != null:
return authenticated(_that.userId);case Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AuthBlocState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.initial()';
}


}




/// @nodoc


class Loading implements AuthBlocState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.loading()';
}


}




/// @nodoc


class OtpSent implements AuthBlocState {
  const OtpSent({required this.phoneNumber, required this.verificationId});
  

 final  String phoneNumber;
 final  String verificationId;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpSentCopyWith<OtpSent> get copyWith => _$OtpSentCopyWithImpl<OtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpSent&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,verificationId);

@override
String toString() {
  return 'AuthBlocState.otpSent(phoneNumber: $phoneNumber, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $OtpSentCopyWith<$Res> implements $AuthBlocStateCopyWith<$Res> {
  factory $OtpSentCopyWith(OtpSent value, $Res Function(OtpSent) _then) = _$OtpSentCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String verificationId
});




}
/// @nodoc
class _$OtpSentCopyWithImpl<$Res>
    implements $OtpSentCopyWith<$Res> {
  _$OtpSentCopyWithImpl(this._self, this._then);

  final OtpSent _self;
  final $Res Function(OtpSent) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? verificationId = null,}) {
  return _then(OtpSent(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OtpVerified implements AuthBlocState {
  const OtpVerified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.otpVerified()';
}


}




/// @nodoc


class Unauthenticated implements AuthBlocState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBlocState.unauthenticated()';
}


}




/// @nodoc


class Authenticated implements AuthBlocState {
  const Authenticated({required this.userId});
  

 final  String userId;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AuthBlocState.authenticated(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthBlocStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(Authenticated(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Failure implements AuthBlocState {
  const Failure({required this.message});
  

 final  String message;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthBlocState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $AuthBlocStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of AuthBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
