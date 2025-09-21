part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.loadChats(String currentUserId) = LoadChats;

  const factory ChatsEvent.createChat(CreateChatParams params) = CreateChat;

  const factory ChatsEvent.sendMessage(MessageParams params) = SendMessage;
  const factory ChatsEvent.watchChats(String currentUserId) = WatchChats;
  const factory ChatsEvent.watchMessage(String chatId) = WatchMessage;
  const factory ChatsEvent.deleteMessage(DeleteMessageParams params) =
      DeleteMessage;
  const factory ChatsEvent.loadChatMessages(String chatId) = LoadChatMessages;
  const factory ChatsEvent.readMessage(MessageParams params) = ReadMessage;
}
