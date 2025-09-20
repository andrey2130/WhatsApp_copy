import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class CreateMessageUsecase implements UseCase<MessageParams, MessageParams> {
  final ChatListRepo _chatListRepo;

  const CreateMessageUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<MessageParams> call(MessageParams params) async {
    final message = params.copyWith(
      isRead: false,
      sentAt: DateTime.now().toIso8601String(),
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    final either = await _chatListRepo.sendMessage(message: message);
    return either.fold((failure) => throw failure, (_) => message);
  }
}
