import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class DeleteConversationUsecase implements UseCase<void, String> {
  final ChatListRepo _chatListRepo;

  const DeleteConversationUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(String conversationId) async {
    final either = await _chatListRepo.deleteConversation(
      conversationId: conversationId,
    );
    return either.fold((l) => throw l, (_) => null);
  }
}
