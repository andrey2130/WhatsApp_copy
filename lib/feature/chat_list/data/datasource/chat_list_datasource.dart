import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';

import 'package:telegram_copy/injections.dart';

abstract class ChatListDatasource {
  Future<Either<Failure, List<Map<String, dynamic>>>> getUsersList();
}

@Injectable(as: ChatListDatasource)
class ChatListDatasourceImpl implements ChatListDatasource {
  final FirebaseFirestore _firestore;

  ChatListDatasourceImpl(this._firestore);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getUsersList() async {
    try {
      final users = await _firestore.collection('users').get();
      return Right(users.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
