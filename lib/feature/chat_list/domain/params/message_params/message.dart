import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class MessageParams with _$MessageParams {
  const factory MessageParams({
    required String id,
    required String chatId,
    required String senderId,
    required String receiverId,
    required String senderName,
    required String receiverName,
    required String message,
    required String createdAt,
    required String updatedAt,
    required String firstUserAvatar,
    required String secondUserAvatar,
    String? replyToMessageId,
    String? replyText,
    String? imageUrl,
    @Default(false) bool isRead,
  }) = _MessageParams;

  factory MessageParams.fromJson(Map<String, dynamic> json) =>
      _$MessageParamsFromJson(json);
}
