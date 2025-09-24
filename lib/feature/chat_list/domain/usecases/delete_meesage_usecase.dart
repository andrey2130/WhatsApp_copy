import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';
import 'package:telegram_copy/injections.dart';

@injectable
class DeleteMeesageUsecase
    implements UseCase<DeleteMessageParams, DeleteMessageParams> {
  final ChatRepo _chatRepo;

  DeleteMeesageUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  @override
  Future<DeleteMessageParams> call(DeleteMessageParams params) async {
    getIt<Talker>().info(
      'DeleteMeesageUsecase: Starting deletion of message ${params.messageId}',
    );
    final result = await _chatRepo.deleteMessage(params);
    return result.fold(
      (l) {
        getIt<Talker>().error(
          'DeleteMeesageUsecase: Failed to delete message: ${l.message}',
        );
        throw Exception(l.message);
      },
      (r) {
        getIt<Talker>().info(
          'DeleteMeesageUsecase: Successfully deleted message ${params.messageId}',
        );
        return r;
      },
    );
  }
}
