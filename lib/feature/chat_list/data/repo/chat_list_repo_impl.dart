import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/data/datasource/chat_list_datasource.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: ChatListRepo)
class ChatListRepoImpl implements ChatListRepo {
  final ChatListDatasource _chatListDatasource;

  ChatListRepoImpl({required ChatListDatasource chatListDatasource})
    : _chatListDatasource = chatListDatasource;

  @override
  Future<Either<Failure, List<UserParams>>> getAllUsers() async {
    try {
      final result = await _chatListDatasource.getAllUsers();
      getIt<Talker>().info('All users loaded: $result');
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
