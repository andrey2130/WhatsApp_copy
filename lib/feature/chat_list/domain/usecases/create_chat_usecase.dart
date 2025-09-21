import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class CreateChatUsecase implements UseCase<CreateChatParams, CreateChatParams> {
  final ChatRepo _chatRepo;

  CreateChatUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<CreateChatParams> call(CreateChatParams params) async {
    final result = await _chatRepo.createChat(params);
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }
}
