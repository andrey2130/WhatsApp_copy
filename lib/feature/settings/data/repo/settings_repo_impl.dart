import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/settings/data/datasource/settings_datasource.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/feature/settings/domain/repo/settings_repo.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: SettingsRepo)
class SettingsRepoImpl implements SettingsRepo {
  final SettingsDatasource _settingsDatasource;

  SettingsRepoImpl({required SettingsDatasource settingsDatasource})
    : _settingsDatasource = settingsDatasource;

  @override
  Future<Either<Failure, UserParams>> getUserData() async {
    try {
      final result = await _settingsDatasource.getUserData();
      getIt<Talker>().info('User loaded: $result');
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserName({required String name}) async {
    try {
      await _settingsDatasource.updateUserName(name: name);
      return Right(null);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAbout({required String about}) async {
    try {
      await _settingsDatasource.updateAbout(about: about);
      return Right(null);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
