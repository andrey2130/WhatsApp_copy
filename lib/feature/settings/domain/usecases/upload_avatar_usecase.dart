import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/upload_avatar_params.dart';
import 'package:telegram_copy/feature/settings/domain/repo/settings_repo.dart';

@injectable
class UploadAvatarUsecase
    implements UseCase<Either<Failure, String>, UploadAvatarParams> {
  final SettingsRepo _settingsRepo;

  UploadAvatarUsecase(this._settingsRepo);

  @override
  Future<Either<Failure, String>> call(UploadAvatarParams params) async {
    return _settingsRepo.uploadAvatar(params: params);
  }
}