import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/repo/settings_repo.dart';

@Injectable()
class UpdateUserNameUsecase implements UseCase<void, String> {
  final SettingsRepo _settingsRepo;

  const UpdateUserNameUsecase({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo;

  @override
  Future<void> call(String params) async {
    final either = await _settingsRepo.updateUserName(name: params);
    return either.fold((l) => throw l, (r) => r);
  }
}
