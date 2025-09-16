import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';

import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> registerViaEmail({
    required RegisterParams params,
  });
  Future<Either<Failure, String>> loginViaEmail({
    required LoginParams params,
  });
  Future<Either<Failure, String>> sendOtp({required SendOtpParams params});
  Future<Either<Failure, void>> verifyOtp({required VerifyOtpParams params});
  Future<void> logOut();
}
