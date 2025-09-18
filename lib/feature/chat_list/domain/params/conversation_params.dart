import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_params.freezed.dart';
part 'conversation_params.g.dart';

@freezed
abstract class ConversationParams with _$ConversationParams {
  const factory ConversationParams({
    required String id,
    required String title,
    required bool isGroup,
    required List<String> participantIds,
    required String creatorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? avatarUrl,
    String? lastMessageId,
    String? lastMessageText,
    String? lastMessageSenderId,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    @Default(false) bool isMuted,
    @Default(false) bool isPinned,
    @Default(false) bool isArchived,
  }) = _ConversationParams;

  factory ConversationParams.fromJson(Map<String, dynamic> json) =>
      _$ConversationParamsFromJson(json);
}
