import 'package:injectable/injectable.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class WatchMessageUsecase {
  final ChatRepo _chatRepo;

  WatchMessageUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  Stream<List<MessageParams>> call(String chatId) {
    return _chatRepo.watchMessages(chatId);
  }
}
