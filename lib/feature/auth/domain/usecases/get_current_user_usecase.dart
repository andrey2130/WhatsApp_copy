import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/auth/domain/repo/auth_repo.dart';

@injectable
class GetCurrentUserUsecase
    implements UseCase<Either<Failure, String?>, NoParams> {
  final AuthRepo _authRepo;

  GetCurrentUserUsecase(this._authRepo);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await _authRepo.getCurrentUser();
  }
}
