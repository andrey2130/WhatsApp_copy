import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@Injectable()
class RegisterViaEmailUsecase
    implements UseCase<Either<Failure, String>, RegisterParams> {
  final AuthRepo _authRepo;

  RegisterViaEmailUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, String>> call(RegisterParams params) {
    return _authRepo.registerViaEmail(params: params);
  }
}
