import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserParams>> getUserData();
}
