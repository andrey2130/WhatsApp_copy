part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadRequested() = LoadRequested;
  const factory SettingsEvent.updateUserName({required String name}) =
      UpdateUserName;
  const factory SettingsEvent.updateAbout({required String about}) =
      UpdateAbout;
}
