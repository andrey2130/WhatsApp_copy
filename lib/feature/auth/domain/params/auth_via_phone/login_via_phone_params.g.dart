// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_via_phone_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginViaPhoneParams _$LoginViaPhoneParamsFromJson(Map<String, dynamic> json) =>
    _LoginViaPhoneParams(
      phoneNumber: json['phoneNumber'] as String,
      otpCode: json['otpCode'] as String,
    );

Map<String, dynamic> _$LoginViaPhoneParamsToJson(
  _LoginViaPhoneParams instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'otpCode': instance.otpCode,
};
