import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/delete_conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class DeleteConversationUsecase
    implements UseCase<void, DeleteConversationParams> {
  final ChatListRepo _chatListRepo;

  const DeleteConversationUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(DeleteConversationParams params) async {
    final either = await _chatListRepo.deleteConversation(
      conversationId: params.conversationId,
    );
    return either.fold((l) => throw l, (_) => null);
  }
}
