import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
abstract class ChatParams with _$ChatParams {
  const factory ChatParams({
    required String id,
    required String firstUserName,
    required String secondUserName,
    required String firstUserId,
    required String secondUserId,
    required String createdAt,
    required String updatedAt,
    required String firstUserAvatar,
    required String secondUserAvatar,
    String? lastMessage,
    @Default({}) Map<String, int> unreadCount,
    @Default(false)  bool isFavorite,
    @Default(false)  bool isGroup,
    @Default(<String> []) List<String> participants,
  }) = _ChatParams;
  factory ChatParams.fromJson(Map<String, dynamic> json) =>
      _$ChatParamsFromJson(json);
}
