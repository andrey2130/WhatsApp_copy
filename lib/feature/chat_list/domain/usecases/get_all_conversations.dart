import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class GetAllConversationsUsecase
    implements UseCase<List<ConversationParams>, NoParams> {
  final ChatListRepo _chatListRepo;
  const GetAllConversationsUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<List<ConversationParams>> call(NoParams params) async {
    final either = await _chatListRepo.getAllConversations();
    return either.fold((l) => throw l, (r) => r);
  }
}
