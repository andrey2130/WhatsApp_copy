import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/upload_avatar_params.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/get_user_data_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/update_about_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/update_user_name_usecase.dart';
import 'package:telegram_copy/feature/settings/domain/usecases/upload_avatar_usecase.dart';
import 'package:telegram_copy/injections.dart';
part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final UpdateUserNameUsecase _updateUserNameUsecase;
  final UpdateAboutUsecase _updateAboutUsecase;
  final UploadAvatarUsecase _uploadAvatarUsecase;
  SettingsBloc({
    required GetUserDataUsecase getUserDataUsecase,
    required UpdateUserNameUsecase updateUserNameUsecase,
    required UpdateAboutUsecase updateAboutUsecase,
    required UploadAvatarUsecase uploadAvatarUsecase,
  }) : _getUserDataUsecase = getUserDataUsecase,
       _updateUserNameUsecase = updateUserNameUsecase,
       _updateAboutUsecase = updateAboutUsecase,
       _uploadAvatarUsecase = uploadAvatarUsecase,
       super(const SettingsState.initial()) {
    on<LoadRequested>(_onLoadRequested);
    on<UpdateUserName>(_onUpdateUserName);
    on<UpdateAbout>(_onUpdateAbout);
    on<UploadAvatar>(_onUploadAvatar);
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

  Future<void> _onUpdateAbout(
    UpdateAbout event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());

    try {
      await _updateAboutUsecase(event.about);
      final user = await _getUserDataUsecase(NoParams());
      emit(SettingsState.success(user));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(SettingsState.failure(e));
    }
  }

  Future<void> _onUploadAvatar(
    UploadAvatar event,
    Emitter<SettingsState> emit,
  ) async {
    final current = state;
    if (current is! Success) return;
    emit(const SettingsState.loading());
    try {
      final userId = current.user.uid;
      final r = await _uploadAvatarUsecase(
        UploadAvatarParams(userId: userId, filePath: event.filePath),
      );
      if (r.isLeft()) {
      } else {
        final updatedUser = await _getUserDataUsecase(NoParams());
        emit(SettingsState.success(updatedUser));
      }
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(SettingsState.failure(e));
    }
  }
}
