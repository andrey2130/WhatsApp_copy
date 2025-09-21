import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/message.dart';
import 'package:telegram_copy/injections.dart';

abstract class ChatDatasource {
  Future<Either<Failure, CreateChatParams>> createChat(CreateChatParams params);
  Future<Either<Failure, MessageParams>> sendMessage(MessageParams params);
  Future<Either<Failure, List<ChatParams>>> loadChats();
  Future<Either<Failure, List<MessageParams>>> loadChatMessages(String chatId);
}

@Injectable(as: ChatDatasource)
class ChatDatasourceImpl implements ChatDatasource {
  final FirebaseFirestore _firestore;

  ChatDatasourceImpl(this._firestore);

  @override
  Future<Either<Failure, CreateChatParams>> createChat(
    CreateChatParams params,
  ) async {
    try {
      final docRef = _firestore.collection('chats').doc();
      await docRef.set({
        'participants': [params.firstUserId, params.secondUserId],
        'fistUserName': params.firstUserName,
        'secondUserName': params.secondUserName,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      getIt<Talker>().info('Chat created with ID: ${docRef.id}');
      return Right(params);
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
      String chatId = params.chatId;

      final chatDoc = _firestore
          .collection('chats')
          .doc(chatId.isEmpty ? null : chatId);

      if (!(await chatDoc.get()).exists) {
        chatId = chatDoc.id;
        await chatDoc.set({
          'participants': [params.senderId, params.receiverId],
          'fistUserName': params.senderName,
          'secondUserName': params.receiverName,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        getIt<Talker>().info('New chat created with ID: $chatId');
      }

      await chatDoc.collection('messages').doc().set(params.toJson());

      await chatDoc.update({
        'lastMessage': params.message,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      getIt<Talker>().info('Message sent to chat $chatId: ${params.toJson()}');

      final updatedParams = params.copyWith(chatId: chatId);

      return Right(updatedParams);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatParams>>> loadChats() async {
    try {
      final chatsSnapshot = await _firestore.collection('chats').get();

      if (chatsSnapshot.docs.isEmpty) {
        getIt<Talker>().info('No chats found in Firestore');
        return const Right([]);
      }

      final chatList = chatsSnapshot.docs.map((doc) {
        final data = doc.data();

        getIt<Talker>().info('Document ${doc.id} data: $data');

        final chatParams = ChatParams(
          id: doc.id,
          fistUserName: data['fistUserName'] ?? 'Unknown',
          secondUserName: data['secondUserName'] ?? 'Unknown',
          firstUserId:
              (data['participants'] != null && data['participants'].isNotEmpty)
              ? data['participants'][0]
              : '',
          secondUserId:
              (data['participants'] != null && data['participants'].length > 1)
              ? data['participants'][1]
              : '',
          createdAt: data['createdAt'] is Timestamp
              ? (data['createdAt'] as Timestamp).toDate().toIso8601String()
              : DateTime.now().toIso8601String(),
          lastMessage: data['lastMessage'] ?? '',
          updatedAt: data['updatedAt'] is Timestamp
              ? (data['updatedAt'] as Timestamp).toDate().toIso8601String()
              : DateTime.now().toIso8601String(),
        );

        getIt<Talker>().info('Created ChatParams: $chatParams');
        return chatParams;
      }).toList();

      getIt<Talker>().info('Loaded ${chatList.length} chats');
      return Right(chatList);
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
      final messages = await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('createdAt', descending: false)
          .get();

      return Right(
        messages.docs.map((doc) => MessageParams.fromJson(doc.data())).toList(),
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }
}
