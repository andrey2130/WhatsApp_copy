part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.load() = LoadMessages;
  const factory MessagesEvent.send(MessageParams message) = SendMessage;
  const factory MessagesEvent.update(MessageParams message) = UpdateMessage;
  const factory MessagesEvent.delete(String messageId) = DeleteMessage;
  const factory MessagesEvent.subscribe(String conversationId) = SubscribeMessages;
}