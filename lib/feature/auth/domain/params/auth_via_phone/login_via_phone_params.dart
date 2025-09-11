import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_via_phone_params.freezed.dart';
part 'login_via_phone_params.g.dart';

@freezed
abstract class LoginViaPhoneParams with _$LoginViaPhoneParams {
  const factory LoginViaPhoneParams({
    required String phoneNumber,
    required String otpCode,
  }) = _LoginViaPhoneParams;

  factory LoginViaPhoneParams.fromJson(Map<String, dynamic> json) =>
      _$LoginViaPhoneParamsFromJson(json);
}
