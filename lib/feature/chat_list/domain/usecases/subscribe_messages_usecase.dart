import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/subscribe_messages_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class SubscribeMessagesUsecase
    implements UseCase<Stream<List<MessageParams>>, SubscribeMessagesParams> {
  final ChatListRepo _chatListRepo;

  const SubscribeMessagesUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<Stream<List<MessageParams>>> call(
    SubscribeMessagesParams params,
  ) async {
    return _chatListRepo.messagesStream(conversationId: params.conversationId);
  }
}
