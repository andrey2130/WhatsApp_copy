part of 'users_bloc.dart';

@freezed
class UsersEvent with _$UsersEvent {
  const factory UsersEvent.loadUsers() = LoadUsers;
  const factory UsersEvent.loadedUsers(List<Map<String, dynamic>> users) =
      LoadedUsers;
  const factory UsersEvent.loadedMoreUsers(List<Map<String, dynamic>> users) =
      LoadedMoreUsers;
}
