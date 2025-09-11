import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_params.freezed.dart';
part 'send_otp_params.g.dart';

@freezed
abstract class SendOtpParams with _$SendOtpParams {
  const factory SendOtpParams({required String phoneNumber}) = _SendOtpParams;

  factory SendOtpParams.fromJson(Map<String, dynamic> json) =>
      _$SendOtpParamsFromJson(json);
}
