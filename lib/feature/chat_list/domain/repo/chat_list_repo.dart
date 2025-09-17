import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

abstract class ChatListRepo {
  Future<Either<Failure, List<UserParams>>> getAllUsers();
}
