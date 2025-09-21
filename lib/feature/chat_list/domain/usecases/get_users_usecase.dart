import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';
import 'package:telegram_copy/injections.dart';

@injectable
class GetUsersUsecase implements UseCase<List<Map<String, dynamic>>, void> {
  final ChatListRepo _chatListRepo;

  GetUsersUsecase({required ChatListRepo chatListRepo})
    : _chatListRepo = chatListRepo;

  @override
  Future<List<Map<String, dynamic>>> call(void params) async {
    try {
      final result = await _chatListRepo.getUsersList();
      return result.fold((l) => throw Exception(l.message), (r) => r);
    } catch (e) {
      getIt<Talker>().handle(e);
      rethrow;
    }
  }
}
