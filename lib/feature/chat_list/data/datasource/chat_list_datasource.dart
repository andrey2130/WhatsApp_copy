import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

abstract class ChatListDatasource {
  Future<List<UserParams>> getAllUsers();
  Future<Either<Failure, List<ConversationParams>>> getAllConversations();
  Future<Either<Failure, List<MessageParams>>> getAllMessages();
  Future<Either<Failure, void>> sendMessage({required MessageParams message});
  Future<Either<Failure, void>> sendConversation({
    required ConversationParams conversation,
  });
  Future<Either<Failure, void>> updateConversation({
    required ConversationParams conversation,
  });
  Future<Either<Failure, void>> deleteConversation({
    required String conversationId,
  });
  Future<Either<Failure, void>> deleteMessage({required String messageId});
  Future<Either<Failure, void>> updateMessage({required MessageParams message});
  Stream<List<ConversationParams>> conversationsStream();
  Stream<List<MessageParams>> messagesStream({required String conversationId});
}

@Injectable(as: ChatListDatasource)
class ChatListDatasourceImpl implements ChatListDatasource {
  final FirebaseFirestore _firestore;

  ChatListDatasourceImpl(this._firestore);

  @override
  Future<List<UserParams>> getAllUsers() async {
    final snap = await _firestore.collection('users').get();
    return snap.docs.map((e) => UserParams.fromJson(e.data())).toList();
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required MessageParams message,
  }) async {
    try {
      final docRef = _firestore.collection('messages').doc();
      final messageWithId = message.copyWith(id: docRef.id);
      await docRef.set(messageWithId.toJson());
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendConversation({
    required ConversationParams conversation,
  }) async {
    try {
      await _firestore.collection('conversations').add(conversation.toJson());
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ConversationParams>>>
  getAllConversations() async {
    try {
      final snap = await _firestore.collection('conversations').get();
      return Right(
        snap.docs.map((e) => ConversationParams.fromJson(e.data())).toList(),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageParams>>> getAllMessages() async {
    try {
      final snap = await _firestore.collection('messages').get();
      return Right(
        snap.docs.map((e) => MessageParams.fromJson(e.data())).toList(),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<ConversationParams>> conversationsStream() {
    return _firestore
        .collection('conversations')
        .snapshots()
        .map(
          (query) => query.docs
              .map((e) => ConversationParams.fromJson(e.data()))
              .toList(),
        );
  }

  @override
  Stream<List<MessageParams>> messagesStream({required String conversationId}) {
    return _firestore
        .collection('messages')
        .where('conversationId', isEqualTo: conversationId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (query) =>
              query.docs.map((e) => MessageParams.fromJson(e.data())).toList(),
        );
  }

  @override
  Future<Either<Failure, void>> deleteConversation({
    required String conversationId,
  }) async {
    try {
      await _firestore.collection('conversations').doc(conversationId).delete();
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessage({
    required String messageId,
  }) async {
    try {
      await _firestore.collection('messages').doc(messageId).delete();
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateConversation({
    required ConversationParams conversation,
  }) async {
    try {
      await _firestore
          .collection('conversations')
          .doc(conversation.id)
          .update(conversation.toJson());
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateMessage({
    required MessageParams message,
  }) async {
    try {
      await _firestore
          .collection('messages')
          .doc(message.id)
          .update(message.toJson());
      return Right(null);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }
}
