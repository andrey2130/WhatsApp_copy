import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

class DeleteMessageParams {
  final String messageId;
  const DeleteMessageParams({required this.messageId});
}

@Injectable()
class DeleteMessageUsecase implements UseCase<void, DeleteMessageParams> {
  final ChatListRepo _chatListRepo;

  const DeleteMessageUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(DeleteMessageParams params) async {
    final either = await _chatListRepo.deleteMessage(
      messageId: params.messageId,
    );
    return either.fold((l) => throw l, (_) => null);
  }
}
