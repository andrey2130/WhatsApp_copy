import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_params.freezed.dart';
part 'message_params.g.dart';

@freezed
abstract class MessageParams with _$MessageParams {
  const factory MessageParams({
    String? id,
    required String content,
    required bool isRead,
    required String sentAt,
    required String createdAt,
    required String updatedAt,
    required String conversationId,
    required String senderId,
  }) = _MessageParams;

  factory MessageParams.fromJson(Map<String, dynamic> json) =>
      _$MessageParamsFromJson(json);
}
