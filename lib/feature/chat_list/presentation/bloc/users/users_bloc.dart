import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_users_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUsecase _getUsersUsecase;

  UsersBloc({required GetUsersUsecase getUsersUsecase})
    : _getUsersUsecase = getUsersUsecase,
      super(const UsersState.initial()) {
    on<LoadUsers>(_onLoadUsers);
    on<LoadedUsers>(_onLoadedUsers);
    on<LoadedMoreUsers>(_onLoadedMoreUsers);
  }

  Future<void> _onLoadUsers(UsersEvent event, Emitter<UsersState> emit) async {
    emit(const UsersState.loading());
    try {
      final users = await _getUsersUsecase(NoParams());
      emit(UsersState.loaded(users));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(UsersState.error(e.toString()));
    }
  }

  Future<void> _onLoadedUsers(
    UsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersState.loading());
  }

  Future<void> _onLoadedMoreUsers(
    UsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersState.loading());
  }
}
