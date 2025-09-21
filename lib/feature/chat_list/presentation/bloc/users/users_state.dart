part of 'users_bloc.dart';

@freezed
abstract class UsersState with _$UsersState {
  const factory UsersState.initial() = Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.loaded(List<Map<String, dynamic>> users) = Loaded;
  const factory UsersState.loadedMore(List<Map<String, dynamic>> users) =
      LoadedMore;
  const factory UsersState.error(String message) = ErrorState;
}
