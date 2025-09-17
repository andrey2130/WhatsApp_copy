part of 'chat_list_bloc.dart';

@freezed
class ChatListEvent with _$ChatListEvent {
  const factory ChatListEvent.started() = Started;
  const factory ChatListEvent.filterChanged(String filter) = FilterChanged;
  const factory ChatListEvent.loadUsers() = LoadUsers;
}
