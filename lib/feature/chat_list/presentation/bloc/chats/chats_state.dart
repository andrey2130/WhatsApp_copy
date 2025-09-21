part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial() = Initial;

  const factory ChatsState.loading() = Loading;

  const factory ChatsState.loaded(List<ChatParams> chats) = Loaded;

  const factory ChatsState.messagesLoaded(List<MessageParams> messages) =
      MessagesLoaded;

  const factory ChatsState.chatWithMessages({
    required List<ChatParams> chats,
    required List<MessageParams> messages,
  }) = ChatWithMessages;

  const factory ChatsState.success() = Success;

  const factory ChatsState.error(String message) = ErrorState;
}
