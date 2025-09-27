import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/injections.dart';

abstract class ChatDatasource {
  Future<Either<Failure, CreateChatParams>> createChat(CreateChatParams params);
  Future<Either<Failure, MessageParams>> sendMessage(MessageParams params);
  Future<Either<Failure, List<ChatParams>>> loadChats(String currentUserId);
  Future<Either<Failure, List<MessageParams>>> loadChatMessages(String chatId);
  Future<Either<Failure, DeleteMessageParams>> deleteMessage(
    DeleteMessageParams params,
  );
  Future<Either<Failure, MessageParams>> readMessage(MessageParams params);
  Future<Either<Failure, void>> updateUnreadCount(
    String chatId,
    String userId,
    int count,
  );
  Future<Either<Failure, Map<String, int>>> calculateUnreadCount(String chatId);
  Stream<List<MessageParams>> watchMessages(String chatId);
  Stream<List<ChatParams>> watchChats(String currentUserId);
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
        'firstUserName': params.firstUserName,
        'secondUserName': params.secondUserName,
        'firstUserAvatar': params.firstUserAvatar,
        'secondUserAvatar': params.secondUserAvatar,
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
          'firstUserName': params.senderName,
          'secondUserName': params.receiverName,
          'firstUserAvatar': params.firstUserAvatar,
          'secondUserAvatar': params.secondUserAvatar,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        getIt<Talker>().info('New chat created with ID: $chatId');
      }

      await chatDoc.collection('messages').doc(params.id).set(params.toJson());
      await chatDoc.update({
        'lastMessage': params.message,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      await updateUnreadCount(chatId, params.receiverId, 1);

      final updatedParams = params.copyWith(chatId: chatId);
      return Right(updatedParams);
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
      final snapshot = await _firestore
          .collection('chats')
          .where('participants', arrayContains: currentUserId)
          .orderBy('updatedAt', descending: true)
          .get();

      if (snapshot.docs.isEmpty) return const Right([]);

      final chatList = await _mapChatDocsToChatParams(snapshot);
      return Right(chatList);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<ChatParams>> watchChats(String currentUserId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .asyncMap(_mapChatDocsToChatParams);
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
          .orderBy('createdAt')
          .get();

      return Right(
        messages.docs.map((doc) => MessageParams.fromJson(doc.data())).toList(),
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<MessageParams>> watchMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((d) => MessageParams.fromJson(d.data()))
              .toList(),
        );
  }

  @override
  Future<Either<Failure, DeleteMessageParams>> deleteMessage(
    DeleteMessageParams params,
  ) async {
    try {
      await _firestore
          .collection('chats')
          .doc(params.chatId)
          .collection('messages')
          .doc(params.messageId)
          .delete();
      return Right(params);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageParams>> readMessage(
    MessageParams params,
  ) async {
    try {
      await _firestore
          .collection('chats')
          .doc(params.chatId)
          .collection('messages')
          .doc(params.id)
          .update({'isRead': true});

      await updateUnreadCount(params.chatId, params.receiverId, -1);
      return Right(params);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUnreadCount(
    String chatId,
    String userId,
    int count,
  ) async {
    try {
      final chatRef = _firestore.collection('chats').doc(chatId);
      final chatDoc = await chatRef.get();

      if (chatDoc.exists) {
        final raw =
            chatDoc.data()?['unreadCount'] as Map<dynamic, dynamic>? ?? {};
        final unreadCount = raw.map(
          (k, v) => MapEntry(
            k.toString(),
            (v is int) ? v : int.tryParse(v.toString()) ?? 0,
          ),
        );
        unreadCount[userId] = ((unreadCount[userId] ?? 0) + count)
            .clamp(0, double.maxFinite)
            .toInt();

        await chatRef.update({'unreadCount': unreadCount});
      }

      return const Right(null);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, int>>> calculateUnreadCount(
    String chatId,
  ) async {
    try {
      final chatDoc = await _firestore.collection('chats').doc(chatId).get();
      if (!chatDoc.exists) return const Right({});

      final data = chatDoc.data()!;
      final participants = List<String>.from(
        (data['participants'] as List<dynamic>? ?? []).map((e) => e.toString()),
      );
      if (participants.isEmpty) return const Right({});

      final unreadMessages = await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .where('isRead', isEqualTo: false)
          .get();

      final unreadCount = {for (var p in participants) p: 0};
      for (final msg in unreadMessages.docs) {
        final receiverId = msg.data()['receiverId'] as String?;
        if (receiverId != null && unreadCount.containsKey(receiverId)) {
          unreadCount[receiverId] = unreadCount[receiverId]! + 1;
        }
      }

      return Right(unreadCount);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  Future<List<ChatParams>> _mapChatDocsToChatParams(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) async {
    final chatList = <ChatParams>[];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final unreadCount = await calculateUnreadCount(doc.id);
      final participants = List<String>.from(
        (data['participants'] as List<dynamic>? ?? []).map((e) => e.toString()),
      );

      chatList.add(
        ChatParams(
          id: doc.id,
          firstUserName: data['firstUserName'] as String? ?? 'Unknown',
          secondUserName: data['secondUserName'] as String? ?? 'Unknown',
          firstUserId: participants.isNotEmpty ? participants[0] : '',
          secondUserId: participants.length > 1 ? participants[1] : '',
          createdAt: _parseTimestamp(data['createdAt']),
          lastMessage: data['lastMessage'] as String? ?? '',
          updatedAt: _parseTimestamp(data['updatedAt']),
          firstUserAvatar: data['firstUserAvatar'] as String? ?? '',
          secondUserAvatar: data['secondUserAvatar'] as String? ?? '',
          unreadCount: unreadCount.fold((l) => <String, int>{}, (r) => r),
        ),
      );
    }

    return chatList;
  }

  String _parseTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) return timestamp.toDate().toIso8601String();
    if (timestamp is String) return timestamp;
    return DateTime.now().toIso8601String();
  }
}
