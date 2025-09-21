import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';

abstract class ChatListRepo {
  Future<Either<Failure, List<Map<String, dynamic>>>> getUsersList();
}
