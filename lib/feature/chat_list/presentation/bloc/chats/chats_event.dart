part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.loadChats() = LoadChats;

  const factory ChatsEvent.createChat(CreateChatParams params) = CreateChat;

  const factory ChatsEvent.sendMessage(MessageParams params) = SendMessage;

  const factory ChatsEvent.loadChatMessages(String chatId) = LoadChatMessages;
}
