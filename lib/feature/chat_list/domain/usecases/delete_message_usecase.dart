import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class DeleteMessageUsecase implements UseCase<void, String> {
  final ChatListRepo _chatListRepo;

  const DeleteMessageUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(String messageId) async {
    final either = await _chatListRepo.deleteMessage(messageId: messageId);
    return either.fold((l) => throw l, (_) => null);
  }
}
