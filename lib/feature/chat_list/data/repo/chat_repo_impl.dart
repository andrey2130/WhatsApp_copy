import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/data/datasource/chat_datasourse.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatDatasource _chatDatasource;
  final FirebaseFirestore _firestore;

  ChatRepoImpl({
    required ChatDatasource chatDatasource,
    required FirebaseFirestore firestore,
  }) : _chatDatasource = chatDatasource,
       _firestore = firestore;

  @override
  Future<Either<Failure, CreateChatParams>> createChat(
    CreateChatParams params,
  ) async {
    try {
      final result = await _chatDatasource.createChat(params);
      return Right(result.fold((l) => throw Exception(l.message), (r) => r));
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageParams>> sendMessage(
    MessageParams params,
  ) async {
    try {
      final result = await _chatDatasource.sendMessage(params);
      return Right(result.fold((l) => throw Exception(l.message), (r) => r));
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatParams>>> loadChats(
    String currentUserId,
  ) async {
    try {
      final snap = await _firestore
          .collection('chats')
          .where('participants', arrayContains: currentUserId)
          .get();
      final result = snap.docs.map((doc) {
        final data = doc.data();
        return ChatParams(
          id: doc.id,
          fistUserName: data['fistUserName'] ?? 'Unknown',
          secondUserName: data['secondUserName'] ?? 'Unknown',
          firstUserId: data['participants'][0] ?? 'Unknown',
          secondUserId: data['participants'][1] ?? 'Unknown',
          createdAt: data['createdAt'] is Timestamp
              ? (data['createdAt'] as Timestamp).toDate().toIso8601String()
              : data['createdAt'] is String
              ? data['createdAt'] as String
              : DateTime.now().toIso8601String(),
          updatedAt: data['updatedAt'] is Timestamp
              ? (data['updatedAt'] as Timestamp).toDate().toIso8601String()
              : data['updatedAt'] is String
              ? data['updatedAt'] as String
              : DateTime.now().toIso8601String(),
          lastMessage: data['lastMessage'] ?? 'Unknown',
        );
      }).toList();
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageParams>>> loadChatMessages(
    String chatId,
  ) async {
    try {
      final result = await _chatDatasource.loadChatMessages(chatId);
      return Right(result.fold((l) => throw Exception(l.message), (r) => r));
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteMessageParams>> deleteMessage(
    DeleteMessageParams params,
  ) async {
    getIt<Talker>().info(
      'ChatRepo: Deleting message ${params.messageId} from chat ${params.chatId}',
    );
    final result = await _chatDatasource.deleteMessage(params);
    result.fold(
      (l) => getIt<Talker>().error(
        'ChatRepo: Failed to delete message: ${l.message}',
      ),
      (r) => getIt<Talker>().info(
        'ChatRepo: Successfully deleted message ${params.messageId}',
      ),
    );
    return result;
  }

  @override
  Future<Either<Failure, MessageParams>> readMessage(
    MessageParams params,
  ) async {
    try {
      final result = await _chatDatasource.readMessage(params);
      return Right(result.fold((l) => throw Exception(l.message), (r) => r));
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<MessageParams>> watchMessages(String chatId) {
    return _chatDatasource.watchMessages(chatId);
  }

  @override
  Stream<List<ChatParams>> watchChats(String currentUserId) {
    return _chatDatasource.watchChats(currentUserId);
  }
}
