// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_messaga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteMessageParams _$DeleteMessageParamsFromJson(Map<String, dynamic> json) =>
    _DeleteMessageParams(
      senderId: json['senderId'] as String,
      chatId: json['chatId'] as String,
      messageId: json['messageId'] as String,
    );

Map<String, dynamic> _$DeleteMessageParamsToJson(
  _DeleteMessageParams instance,
) => <String, dynamic>{
  'senderId': instance.senderId,
  'chatId': instance.chatId,
  'messageId': instance.messageId,
};
