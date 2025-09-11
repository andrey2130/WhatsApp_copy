import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/feature/auth/domain/params/verify_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@Injectable()
class VerifyOtpUsecase
    implements UseCase<Either<Failure, void>, VerifyOtpParams> {
  final AuthRepo _authRepo;

  VerifyOtpUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, void>> call(VerifyOtpParams params) {
    return _authRepo.verifyOtp(params: params);
  }
}
