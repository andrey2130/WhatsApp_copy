import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@Injectable()
class LogOutUsecase implements UseCase<void, NoParams> {
  final AuthRepo _authRepo;

  LogOutUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<void> call(NoParams params) {
    return _authRepo.logOut();
  }
}
