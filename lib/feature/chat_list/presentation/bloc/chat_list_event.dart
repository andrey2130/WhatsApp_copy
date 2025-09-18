part of 'chat_list_bloc.dart';

@freezed
abstract class ChatListEvent with _$ChatListEvent {
  const factory ChatListEvent.loadAllConversations() = LoadAllConversations;
  const factory ChatListEvent.loadAllMessages() = LoadAllMessages;
  const factory ChatListEvent.sendMessage({required MessageParams message}) =
      SendMessage;
  const factory ChatListEvent.sendConversation({
    required ConversationParams conversation,
  }) = SendConversation;
  const factory ChatListEvent.updateConversation({
    required ConversationParams conversation,
  }) = UpdateConversation;
  const factory ChatListEvent.deleteConversation({
    required String conversationId,
  }) = DeleteConversation;
  const factory ChatListEvent.deleteMessage({required String messageId}) =
      DeleteMessage;
  const factory ChatListEvent.updateMessage({required MessageParams message}) =
      UpdateMessage;

  const factory ChatListEvent.subscribeMessages({
    required String conversationId,
  }) = SubscribeMessages;
  const factory ChatListEvent.subscribeConversations() = SubscribeConversations;

  const factory ChatListEvent.filterChanged({required String filter}) =
      FilterChanged;
}
