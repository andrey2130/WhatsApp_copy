import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/settings/domain/repo/settings_repo.dart';

@Injectable()
class UpdateAboutUsecase implements UseCase<void, String> {
  final SettingsRepo _settingsRepo;

  const UpdateAboutUsecase({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo;

  @override
  Future<void> call(String params) async {
    final either = await _settingsRepo.updateAbout(about: params);
    return either.fold((l) => throw l, (r) => r);
  }
}