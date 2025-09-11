import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@Injectable()
class LoginViaEmailUsecase
    implements UseCase<Either<Failure, String>, LoginParams> {
  final AuthRepo _authRepo;

  LoginViaEmailUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return _authRepo.loginViaEmail(params: params);
  }
}
