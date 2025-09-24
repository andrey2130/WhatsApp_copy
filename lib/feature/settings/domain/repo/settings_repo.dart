import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/settings/domain/params/upload_avatar_params.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserParams>> getUserData();
  Future<Either<Failure, void>> updateUserName({required String name});
  Future<Either<Failure, void>> updateAbout({required String about});
  Future<Either<Failure, String>> uploadAvatar({
    required UploadAvatarParams params,
  });

  Future<Either<Failure, void>> deleteAvatar({required String userId});
}
