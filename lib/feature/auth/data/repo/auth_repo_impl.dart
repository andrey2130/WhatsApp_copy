import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/data/datasource/auth_datasource.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDatasource _authDatasource;

  AuthRepoImpl({required AuthDatasource authDatasource})
    : _authDatasource = authDatasource;

  @override
  Future<void> logOut() {
    return _authDatasource.logOut();
  }

  @override
  Future<Either<Failure, String>> sendOtp({
    required SendOtpParams params,
  }) async {
    try {
      final result = await _authDatasource.sendOtp(params: params);
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required VerifyOtpParams params,
  }) async {
    try {
      await _authDatasource.verifyOtp(params: params);
      return Right(null);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginViaEmail({
    required LoginParams params,
  }) async {
    try {
      final result = await _authDatasource.loginViaEmail(params: params);
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> registerViaEmail({
    required RegisterParams params,
  }) async {
    try {
      final result = await _authDatasource.registerViaEmail(params: params);
      getIt<Talker>().info('User registered: $result');
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
