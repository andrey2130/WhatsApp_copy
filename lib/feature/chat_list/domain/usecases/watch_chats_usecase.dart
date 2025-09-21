import 'package:injectable/injectable.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class WatchChatsUsecase {
  final ChatRepo _chatRepo;

  WatchChatsUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  Stream<List<ChatParams>> call(String params) {
    return _chatRepo.watchChats(params);
  }
}
