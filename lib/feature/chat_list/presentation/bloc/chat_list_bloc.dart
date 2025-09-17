import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/users_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_users_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';
part 'chat_list_bloc.freezed.dart';

@Injectable()
class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetAllUsersUsecase _getAllUsersUsecase;

  ChatListBloc({required GetAllUsersUsecase getAllUsersUsecase})
    : _getAllUsersUsecase = getAllUsersUsecase,
      super(const ChatListState.initial()) {
    on<Started>(_onStarted);
    on<FilterChanged>(_onFilterChanged);
    on<LoadUsers>(_onLoadUsers);
  }

  Future<void> _onStarted(Started event, Emitter<ChatListState> emit) async {
    emit(const ChatListState.loaded(selectedFilter: 'All'));
  }

  Future<void> _onFilterChanged(
    FilterChanged event,
    Emitter<ChatListState> emit,
  ) async {
    emit(ChatListState.loaded(selectedFilter: event.filter));
  }

  Future<void> _onLoadUsers(
    LoadUsers event,
    Emitter<ChatListState> emit,
  ) async {
    if (state is Loading || state is Success) {
      return;
    }

    emit(const ChatListState.loading());
    try {
      final users = await _getAllUsersUsecase(GetUsersParams());
      getIt<Talker>().info('Users loaded: ${users.length}');
      emit(ChatListState.success(users: users));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(ChatListState.error(message: e.toString()));
    }
  }
}
