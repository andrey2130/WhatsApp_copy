import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class SubscribeConversationsUsecase
    implements UseCase<Stream<List<ConversationParams>>, NoParams> {
  final ChatListRepo _chatListRepo;

  const SubscribeConversationsUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<Stream<List<ConversationParams>>> call(NoParams params) async {
    return _chatListRepo.conversationsStream();
  }
}
