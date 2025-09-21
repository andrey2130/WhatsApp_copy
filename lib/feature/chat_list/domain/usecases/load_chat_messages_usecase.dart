import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class LoadChatMessagesUsecase implements UseCase<List<MessageParams>, String> {
  final ChatRepo _chatRepo;

  LoadChatMessagesUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<List<MessageParams>> call(String chatId) async {
    final result = await _chatRepo.loadChatMessages(chatId);
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }
}
