part of 'conversations_bloc.dart';

@freezed
class ConversationsEvent with _$ConversationsEvent {
  const factory ConversationsEvent.load() = LoadConversations;
  const factory ConversationsEvent.send(ConversationParams conversation) = SendConversation;
  const factory ConversationsEvent.update(ConversationParams conversation) = UpdateConversation;
  const factory ConversationsEvent.delete(String conversationId) = DeleteConversation;
  const factory ConversationsEvent.subscribe() = SubscribeConversations;
}