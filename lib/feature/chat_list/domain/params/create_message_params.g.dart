// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMessageParams _$CreateMessageParamsFromJson(Map<String, dynamic> json) =>
    _CreateMessageParams(
      id: json['id'] as String,
      content: json['content'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
    );

Map<String, dynamic> _$CreateMessageParamsToJson(
  _CreateMessageParams instance,
) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'conversationId': instance.conversationId,
  'senderId': instance.senderId,
};
