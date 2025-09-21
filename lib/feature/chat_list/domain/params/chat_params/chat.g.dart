// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatParams _$ChatParamsFromJson(Map<String, dynamic> json) => _ChatParams(
  id: json['id'] as String,
  fistUserName: json['fistUserName'] as String,
  secondUserName: json['secondUserName'] as String,
  firstUserId: json['firstUserId'] as String,
  secondUserId: json['secondUserId'] as String,
  createdAt: json['createdAt'] as String,
  lastMessage: json['lastMessage'] as String?,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ChatParamsToJson(_ChatParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fistUserName': instance.fistUserName,
      'secondUserName': instance.secondUserName,
      'firstUserId': instance.firstUserId,
      'secondUserId': instance.secondUserId,
      'createdAt': instance.createdAt,
      'lastMessage': instance.lastMessage,
      'updatedAt': instance.updatedAt,
    };
