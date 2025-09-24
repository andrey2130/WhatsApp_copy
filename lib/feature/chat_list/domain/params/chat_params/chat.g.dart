// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatParams _$ChatParamsFromJson(Map<String, dynamic> json) => _ChatParams(
  id: json['id'] as String,
  firstUserName: json['firstUserName'] as String,
  secondUserName: json['secondUserName'] as String,
  firstUserId: json['firstUserId'] as String,
  secondUserId: json['secondUserId'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  lastMessage: json['lastMessage'] as String?,
  firstUserAvatar: json['firstUserAvatar'] as String,
  secondUserAvatar: json['secondUserAvatar'] as String,
  unreadCount:
      (json['unreadCount'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
);

Map<String, dynamic> _$ChatParamsToJson(_ChatParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstUserName': instance.firstUserName,
      'secondUserName': instance.secondUserName,
      'firstUserId': instance.firstUserId,
      'secondUserId': instance.secondUserId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'lastMessage': instance.lastMessage,
      'firstUserAvatar': instance.firstUserAvatar,
      'secondUserAvatar': instance.secondUserAvatar,
      'unreadCount': instance.unreadCount,
    };
