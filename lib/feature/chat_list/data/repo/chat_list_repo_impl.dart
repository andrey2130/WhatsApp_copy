import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/data/datasource/chat_list_datasource.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: ChatListRepo)
class ChatListRepoImpl implements ChatListRepo {
  final ChatListDatasource _chatListDatasource;

  ChatListRepoImpl({required ChatListDatasource chatListDatasource})
    : _chatListDatasource = chatListDatasource;

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getUsersList() async {
    try {
      final result = await _chatListDatasource.getUsersList();
      return Right(result.fold((l) => throw Exception(l.message), (r) => r));
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
