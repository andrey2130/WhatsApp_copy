import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/verify_otp_params.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> sendOtp({required SendOtpParams params});
  Future<Either<Failure, void>> verifyOtp({required VerifyOtpParams params});
  Future<void> logOut();
}
