import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_chat.freezed.dart';
part 'create_chat.g.dart';

@freezed
abstract class CreateChatParams with _$CreateChatParams {
  const factory CreateChatParams({
    required String firstUserId,
    required String secondUserId,
    required String firstUserName,
    required String secondUserName,
     String? firstUserAvatar,
     String? secondUserAvatar,
  }) = _CreateChatParams;

  factory CreateChatParams.fromJson(Map<String, dynamic> json) =>
      _$CreateChatParamsFromJson(json);
}
