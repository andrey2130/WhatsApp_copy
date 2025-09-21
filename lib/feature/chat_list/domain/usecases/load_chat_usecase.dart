import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class LoadChatsUsecase implements UseCase<List<ChatParams>, void> {
  final ChatRepo _chatRepo;

  LoadChatsUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<List<ChatParams>> call(void params) async {
    final result = await _chatRepo.loadChats();
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }
}
