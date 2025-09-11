part of 'auth_bloc.dart';

@freezed
sealed class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.sendOtp({required SendOtpParams params}) =
      SendOtp;
  const factory AuthBlocEvent.verifyOtp({required VerifyOtpParams params}) =
      VerifyOtp;
  const factory AuthBlocEvent.resendOtp({required SendOtpParams params}) =
      ResendOtp;
  const factory AuthBlocEvent.checkAuthStatus() = CheckAuthStatus;
  const factory AuthBlocEvent.logOut() = LogOut;
}
