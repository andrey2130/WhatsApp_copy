import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/create_message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';

@Injectable()
class CreateMessageUsecase
    implements UseCase<MessageParams, CreateMessageParams> {
  final ChatListRepo _chatListRepo;

  const CreateMessageUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<MessageParams> call(CreateMessageParams params) async {
    final message = MessageParams(
      id: params.id,
      content: params.content,
      isRead: false,
      sentAt: DateTime.now().toIso8601String(),
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      conversationId: params.conversationId,
      senderId: params.senderId,
    );

    final either = await _chatListRepo.sendMessage(message: message);
    return either.fold((failure) => throw failure, (_) => message);
  }
}
