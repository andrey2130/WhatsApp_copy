// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpParams _$VerifyOtpParamsFromJson(Map<String, dynamic> json) =>
    _VerifyOtpParams(
      phoneNumber: json['phoneNumber'] as String,
      otpCode: json['otpCode'] as String,
      verificationId: json['verificationId'] as String,
    );

Map<String, dynamic> _$VerifyOtpParamsToJson(_VerifyOtpParams instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otpCode': instance.otpCode,
      'verificationId': instance.verificationId,
    };
