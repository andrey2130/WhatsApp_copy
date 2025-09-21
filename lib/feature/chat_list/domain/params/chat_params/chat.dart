import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
abstract class ChatParams with _$ChatParams {
  const factory ChatParams({
    required String id,
    required String fistUserName,
    required String secondUserName,
    required String firstUserId,
    required String secondUserId,
    required String createdAt,
    String? lastMessage,
    required String updatedAt,
  }) = _ChatParams;
  factory ChatParams.fromJson(Map<String, dynamic> json) =>
      _$ChatParamsFromJson(json);
}
