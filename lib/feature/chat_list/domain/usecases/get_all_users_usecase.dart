import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

@Injectable()
class GetAllUsersUsecase implements UseCase<List<UserParams>, NoParams> {
  final ChatListRepo _chatListRepo;

  const GetAllUsersUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<List<UserParams>> call(NoParams params) async {
    final either = await _chatListRepo.getAllUsers();
    return either.fold((l) => throw l, (r) => r);
  }
}
