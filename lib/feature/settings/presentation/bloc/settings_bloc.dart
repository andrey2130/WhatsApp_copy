import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/get_user_data_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserDataUsecase _getUserDataUsecase;

  SettingsBloc({required GetUserDataUsecase getUserDataUsecase})
    : _getUserDataUsecase = getUserDataUsecase,
      super(const SettingsState.initial()) {
    on<LoadRequested>(_onLoadRequested);
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
}
