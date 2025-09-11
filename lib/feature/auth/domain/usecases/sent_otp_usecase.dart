import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/params/send_otp_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@Injectable()
class SendOtpUsecase
    implements UseCase<Either<Failure, String>, SendOtpParams> {
  final AuthRepo _authRepo;

  SendOtpUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, String>> call(SendOtpParams params) {
    return _authRepo.sendOtp(params: params);
  }
}
