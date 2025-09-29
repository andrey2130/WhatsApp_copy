part of 'chat_screen_bloc.dart';

@freezed
class ChatScreenEvent with _$ChatScreenEvent {
  const factory ChatScreenEvent.loadMessages(String chatId) = LoadMessages;
  const factory ChatScreenEvent.watchMessages(String chatId) = WatchMessages;
  const factory ChatScreenEvent.sendMessage(MessageParams message) =
      SendMessage;
  const factory ChatScreenEvent.sendPhoto(
    MessageParams message,
    Uint8List file,
  ) = SendPhoto;
  const factory ChatScreenEvent.deleteMessage(DeleteMessageParams params) =
      DeleteMessage;
  const factory ChatScreenEvent.readMessage(MessageParams message) =
      ReadMessage;
  const factory ChatScreenEvent.setReplyMode(MessageParams message) =
      SetReplyMode;
  const factory ChatScreenEvent.clearReplyMode() = ClearReplyMode;
  const factory ChatScreenEvent.scrollToMessage(String messageId) =
      ScrollToMessage;
  const factory ChatScreenEvent.clearHighlight() = ClearHighlight;
}
