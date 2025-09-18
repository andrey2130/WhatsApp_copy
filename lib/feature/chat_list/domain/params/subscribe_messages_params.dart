import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_messages_params.freezed.dart';
part 'subscribe_messages_params.g.dart';

@freezed
abstract class SubscribeMessagesParams with _$SubscribeMessagesParams {
  const factory SubscribeMessagesParams({required String conversationId}) =
      _SubscribeMessagesParams;

  factory SubscribeMessagesParams.fromJson(Map<String, dynamic> json) =>
      _$SubscribeMessagesParamsFromJson(json);
}
