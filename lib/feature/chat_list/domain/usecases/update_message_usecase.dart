import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class UpdateMessageUsecase implements UseCase<void, MessageParams> {
  final ChatListRepo _chatListRepo;

  const UpdateMessageUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<void> call(MessageParams params) async {
    final either = await _chatListRepo.updateMessage(message: params);
    return either.fold((l) => throw l, (_) => null);
  }
}
