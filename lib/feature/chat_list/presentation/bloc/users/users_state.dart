part of 'users_bloc.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = UsersInitial;
  const factory UsersState.loading() = UsersLoading;
  
  const factory UsersState.error({required String message}) = UsersError;
  const factory UsersState.success({required List<UserParams> users}) =
      UsersSuccess;
}
