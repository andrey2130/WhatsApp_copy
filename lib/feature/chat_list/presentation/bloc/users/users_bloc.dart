import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/users_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_users_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

@Injectable()
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetAllUsersUsecase _getAllUsersUsecase;

  UsersBloc({required GetAllUsersUsecase getAllUsersUsecase})
    : _getAllUsersUsecase = getAllUsersUsecase,
      super(const UsersState.initial()) {
    on<UsersStarted>(_onStarted);

    on<UsersLoad>(_onLoadUsers);
  }

  Future<void> _onStarted(UsersStarted event, Emitter<UsersState> emit) async {
    emit(const UsersState.initial());
  }



  Future<void> _onLoadUsers(UsersLoad event, Emitter<UsersState> emit) async {
    emit(const UsersState.loading());
    try {
      final users = await _getAllUsersUsecase(GetUsersParams());
      getIt<Talker>().info('Users loaded: ${users.length}');
      emit(UsersState.success(users: users));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(UsersState.error(message: e.toString()));
    }
  }
}
