import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class SendConversationUsecase implements UseCase<void, ConversationParams> {
  final ChatListRepo _chatListRepo;

  const SendConversationUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(ConversationParams params) async {
    final either = await _chatListRepo.sendConversation(conversation: params);
    return either.fold((l) => throw l, (_) => null);
  }
}
