import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_conversation_params.freezed.dart';
part 'delete_conversation_params.g.dart';

@freezed
abstract class DeleteConversationParams with _$DeleteConversationParams {
  const factory DeleteConversationParams({
    required String conversationId,
  }) = _DeleteConversationParams;

  factory DeleteConversationParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteConversationParamsFromJson(json);
}
