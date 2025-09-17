import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/get_user_data_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/update_user_name_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final UpdateUserNameUsecase _updateUserNameUsecase;
  SettingsBloc({
    required GetUserDataUsecase getUserDataUsecase,
    required UpdateUserNameUsecase updateUserNameUsecase,
  }) : _getUserDataUsecase = getUserDataUsecase,
       _updateUserNameUsecase = updateUserNameUsecase,
       super(const SettingsState.initial()) {
    on<LoadRequested>(_onLoadRequested);
    on<UpdateUserName>(_onUpdateUserName);
  }

  Future<void> _onLoadRequested(
    LoadRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    try {
      final user = await _getUserDataUsecase(NoParams());
      getIt<Talker>().info('Settings user: $user');
      emit(SettingsState.success(user));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(SettingsState.failure(e));
    }
  }

  Future<void> _onUpdateUserName(
    UpdateUserName event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    try {
      await _updateUserNameUsecase(event.name);
      final user = await _getUserDataUsecase(NoParams());
      emit(SettingsState.success(user));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(SettingsState.failure(e));
    }
  }
}
