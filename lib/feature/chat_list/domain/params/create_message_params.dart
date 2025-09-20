import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_message_params.freezed.dart';
part 'create_message_params.g.dart';

@freezed
abstract class CreateMessageParams with _$CreateMessageParams {
  const factory CreateMessageParams({
    required String id,
    required String content,
    required String conversationId,
    required String senderId,
  }) = _CreateMessageParams;

  factory CreateMessageParams.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageParamsFromJson(json);
}
