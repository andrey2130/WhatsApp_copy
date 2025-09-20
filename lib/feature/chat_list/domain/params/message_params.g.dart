// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageParams _$MessageParamsFromJson(Map<String, dynamic> json) =>
    _MessageParams(
      id: json['id'] as String?,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      sentAt: json['sentAt'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
    );

Map<String, dynamic> _$MessageParamsToJson(_MessageParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'isRead': instance.isRead,
      'sentAt': instance.sentAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
    };
