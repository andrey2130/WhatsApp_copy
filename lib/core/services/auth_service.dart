import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';

abstract class AuthService {
  Future<Either<Failure, String?>> getCurrentUserId();
  Future<Either<Failure, bool>> isUserAuthenticated();
  Stream<String?> get authStateChanges;
}
