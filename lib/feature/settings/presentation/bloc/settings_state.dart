part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = Initial;
  const factory SettingsState.loading() = Loading;
  const factory SettingsState.success(UserParams user) = Success;
  const factory SettingsState.failure(Object error) = Failure;
}
