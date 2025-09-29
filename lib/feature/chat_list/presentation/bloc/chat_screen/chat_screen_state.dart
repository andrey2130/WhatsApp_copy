part of 'chat_screen_bloc.dart';

@freezed
class ChatScreenState with _$ChatScreenState {
  const factory ChatScreenState.initial() = Initial;
  const factory ChatScreenState.loading() = Loading;
  const factory ChatScreenState.loaded({
    @Default([]) List<MessageParams> messages,
    @Default(false) bool isReplyMode,
    MessageParams? replyToMessage,
    @Default(false) bool isScrollingToMessage,
    String? highlightedMessageId,
  }) = Loaded;
  const factory ChatScreenState.error(String message) = Error;
}
