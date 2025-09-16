import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_params.freezed.dart';
part 'verify_otp_params.g.dart';

@freezed
abstract class VerifyOtpParams with _$VerifyOtpParams {
  const factory VerifyOtpParams({
    required String phoneNumber,
    required String otpCode,
    required String verificationId,
  }) = _VerifyOtpParams;

  factory VerifyOtpParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpParamsFromJson(json);
}
