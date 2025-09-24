part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadRequested() = LoadRequested;
  const factory SettingsEvent.updateUserName({required String name}) =
      UpdateUserName;
  const factory SettingsEvent.updateAbout({required String about}) =
      UpdateAbout;
      const factory SettingsEvent.uploadAvatar({required String filePath}) = UploadAvatar;
}
