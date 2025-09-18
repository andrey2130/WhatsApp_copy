part of 'chat_list_bloc.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = Initial;

  // Conversations
  const factory ChatListState.conversationsLoading() = ConversationsLoading;
  const factory ChatListState.conversationsSuccess({
    required List<ConversationParams> conversations,
  }) = ConversationsSuccess;
  const factory ChatListState.conversationsError({required String message}) =
      ConversationsError;

  // Messages for a specific conversation
  const factory ChatListState.messagesLoading({
    required String conversationId,
    required List<ConversationParams> conversations,
  }) = MessagesLoading;
  const factory ChatListState.messagesSuccess({
    required String conversationId,
    required List<ConversationParams> conversations,
    required List<MessageParams> messages,
  }) = MessagesSuccess;
  const factory ChatListState.messagesError({
    required String conversationId,
    required String message,
  }) = MessagesError;

  // Filter
  const factory ChatListState.filterChanged({required String filter}) =
      ChatListLoaded;
}
