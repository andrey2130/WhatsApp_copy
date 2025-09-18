// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationParams _$ConversationParamsFromJson(Map<String, dynamic> json) =>
    _ConversationParams(
      id: json['id'] as String,
      title: json['title'] as String,
      isGroup: json['isGroup'] as bool,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      creatorId: json['creatorId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      avatarUrl: json['avatarUrl'] as String?,
      lastMessageId: json['lastMessageId'] as String?,
      lastMessageText: json['lastMessageText'] as String?,
      lastMessageSenderId: json['lastMessageSenderId'] as String?,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isMuted: json['isMuted'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$ConversationParamsToJson(_ConversationParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isGroup': instance.isGroup,
      'participantIds': instance.participantIds,
      'creatorId': instance.creatorId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
      'lastMessageId': instance.lastMessageId,
      'lastMessageText': instance.lastMessageText,
      'lastMessageSenderId': instance.lastMessageSenderId,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'isMuted': instance.isMuted,
      'isPinned': instance.isPinned,
      'isArchived': instance.isArchived,
    };
