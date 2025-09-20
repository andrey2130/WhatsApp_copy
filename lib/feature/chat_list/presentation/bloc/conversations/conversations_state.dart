part of 'conversations_bloc.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const factory ConversationsState.initial() = Initial;
  const factory ConversationsState.loading() = Loading;
  const factory ConversationsState.success(
    List<ConversationParams> conversations,
  ) = Success;
  const factory ConversationsState.error(String message) = Error;
}
