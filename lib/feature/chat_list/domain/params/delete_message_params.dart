import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_message_params.freezed.dart';
part 'delete_message_params.g.dart';

@freezed
abstract class DeleteMessageParams with _$DeleteMessageParams {
  const factory DeleteMessageParams({
    required String messageId,
  }) = _DeleteMessageParams;

  factory DeleteMessageParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageParamsFromJson(json);
}
