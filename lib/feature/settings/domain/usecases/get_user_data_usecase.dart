import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/feature/settings/domain/repo/settings_repo.dart';

@injectable
class GetUserDataUsecase implements UseCase<UserParams, NoParams> {
  final SettingsRepo _settingsRepo;

  const GetUserDataUsecase({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo;

  @override
  Future<UserParams> call(NoParams params) async {
    final either = await _settingsRepo.getUserData();
    return either.fold((l) => throw l, (r) => r);
  }
}
