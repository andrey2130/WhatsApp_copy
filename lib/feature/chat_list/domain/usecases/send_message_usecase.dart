import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class SendMessageUsecase implements UseCase<MessageParams, MessageParams> {
  final ChatRepo _chatRepo;

  SendMessageUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<MessageParams> call(MessageParams params) async {
    final result = await _chatRepo.sendMessage(params);
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }
}
