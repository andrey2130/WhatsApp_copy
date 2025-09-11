import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/data/datasource/auth_datasource.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

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
  Future<Either<Failure, String>> sendOtp({required SendOtpParams params}) async {
   try {
    final result = await _authDatasource.sendOtp(params: params);
    return Right(result);
   }
    catch (e) {
    return Left(Failure(message: e.toString()));
   }
   
  }

  @override
  Future<Either<Failure, void>> verifyOtp({required VerifyOtpParams params}) async {
    try {
      await _authDatasource.verifyOtp(params: params);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
