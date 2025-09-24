// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateChatParams _$CreateChatParamsFromJson(Map<String, dynamic> json) =>
    _CreateChatParams(
      firstUserId: json['firstUserId'] as String,
      secondUserId: json['secondUserId'] as String,
      firstUserName: json['firstUserName'] as String,
      secondUserName: json['secondUserName'] as String,
      firstUserAvatar: json['firstUserAvatar'] as String?,
      secondUserAvatar: json['secondUserAvatar'] as String?,
    );

Map<String, dynamic> _$CreateChatParamsToJson(_CreateChatParams instance) =>
    <String, dynamic>{
      'firstUserId': instance.firstUserId,
      'secondUserId': instance.secondUserId,
      'firstUserName': instance.firstUserName,
      'secondUserName': instance.secondUserName,
      'firstUserAvatar': instance.firstUserAvatar,
      'secondUserAvatar': instance.secondUserAvatar,
    };
