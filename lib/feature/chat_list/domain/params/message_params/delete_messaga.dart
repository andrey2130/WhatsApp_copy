import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_messaga.freezed.dart';
part 'delete_messaga.g.dart';

@freezed
abstract class DeleteMessageParams with _$DeleteMessageParams {
  const factory DeleteMessageParams({
    required String senderId,
    required String chatId,
    required String messageId,
  }) = _DeleteMessageParams;

  factory DeleteMessageParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageParamsFromJson(json);
}
