part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.initial() = Initial;
  const factory MessagesState.loading() = Loading;
  const factory MessagesState.success(List<MessageParams> messages) = Success;
  const factory MessagesState.error(String message) = Error;
}