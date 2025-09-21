import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class ReadMessageUsecase implements UseCase<MessageParams, MessageParams> {
  final ChatRepo _chatRepo;

  ReadMessageUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<MessageParams> call(MessageParams params) async {
    final result = await _chatRepo.readMessage(params);
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }
}
