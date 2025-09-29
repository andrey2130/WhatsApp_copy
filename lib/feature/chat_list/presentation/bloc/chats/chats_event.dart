part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.loadChats(String currentUserId, String? filter) =
      LoadChats;
  const factory ChatsEvent.createChat(CreateChatParams params) = CreateChat;
  const factory ChatsEvent.watchChats(String currentUserId) = WatchChats;
}
