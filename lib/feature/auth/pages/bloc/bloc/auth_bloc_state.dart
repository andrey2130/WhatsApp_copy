part of 'auth_bloc.dart';

@freezed
sealed class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = Initial;
  const factory AuthBlocState.loading() = Loading;
  const factory AuthBlocState.otpSent({
    required String phoneNumber,
    required String verificationId,
  }) = OtpSent;
  const factory AuthBlocState.otpVerified() = OtpVerified;
  const factory AuthBlocState.unauthenticated() = Unauthenticated;
  const factory AuthBlocState.authenticated({required String userId}) =
      Authenticated;
  const factory AuthBlocState.failure({required String message}) = Failure;
}
