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
        'fistUserName': params.firstUserName,
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
          'fistUserName': params.senderName,
          'secondUserName': params.receiverName,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        getIt<Talker>().info('New chat created with ID: $chatId');
      }

      getIt<Talker>().info(
        'Saving message with ID: ${params.id} to chat: $chatId',
      );
      await chatDoc.collection('messages').doc(params.id).set(params.toJson());

      await chatDoc.update({
        'lastMessage': params.message,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Update unread count for the receiver
      await updateUnreadCount(chatId, params.receiverId, 1);

      getIt<Talker>().info('Message sent to chat $chatId: ${params.toJson()}');

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
      final chatsSnapshot = await _firestore
          .collection('chats')
          .where('participants', arrayContains: currentUserId)
          .get();

      if (chatsSnapshot.docs.isEmpty) {
        getIt<Talker>().info('No chats found for user $currentUserId');
        return const Right([]);
      }

      final chatList = <ChatParams>[];

      for (final doc in chatsSnapshot.docs) {
        final data = doc.data();
        final unreadCount = await calculateUnreadCount(doc.id);

        chatList.add(
          ChatParams(
            id: doc.id,
            firstUserName: data['firstUserName'] ?? 'Unknown',
            secondUserName: data['secondUserName'] ?? 'Unknown',
            firstUserId:
                (data['participants'] != null &&
                    data['participants'].isNotEmpty)
                ? data['participants'][0]
                : '',
            secondUserId:
                (data['participants'] != null &&
                    data['participants'].length > 1)
                ? data['participants'][1]
                : '',
            createdAt: _parseTimestamp(data['createdAt']),
            lastMessage: data['lastMessage'] ?? '',
            updatedAt: _parseTimestamp(data['updatedAt']),
            unreadCount: unreadCount.fold((l) => {}, (r) => r),
          ),
        );
      }

      getIt<Talker>().info(
        'Loaded ${chatList.length} chats for $currentUserId',
      );
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

  @override
  Future<Either<Failure, DeleteMessageParams>> deleteMessage(
    DeleteMessageParams params,
  ) async {
    try {
      getIt<Talker>().info(
        'Attempting to delete message ${params.messageId} from chat ${params.chatId}',
      );
      await _firestore
          .collection('chats')
          .doc(params.chatId)
          .collection('messages')
          .doc(params.messageId)
          .delete();
      getIt<Talker>().info(
        'Message ${params.messageId} successfully deleted from Firestore',
      );
      return Right(params);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      rethrow;
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

      // Update unread count for the receiver
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
        final data = chatDoc.data()!;
        final unreadCount = Map<String, int>.from(data['unreadCount'] ?? {});
        final currentCount = unreadCount[userId] ?? 0;
        final newCount = (currentCount + count)
            .clamp(0, double.infinity)
            .toInt();
        unreadCount[userId] = newCount;

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
      final chatRef = _firestore.collection('chats').doc(chatId);
      final chatDoc = await chatRef.get();

      if (!chatDoc.exists) {
        return const Right({});
      }

      final data = chatDoc.data()!;
      final participants = List<String>.from(data['participants'] ?? []);

      if (participants.isEmpty) {
        return const Right({});
      }

      // Get all unread messages for this chat
      final unreadMessages = await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .where('isRead', isEqualTo: false)
          .get();

      // Count unread messages per user
      final Map<String, int> unreadCount = {};
      for (final participant in participants) {
        unreadCount[participant] = 0;
      }

      for (final doc in unreadMessages.docs) {
        final messageData = doc.data();
        final receiverId = messageData['receiverId'] as String?;
        if (receiverId != null && unreadCount.containsKey(receiverId)) {
          unreadCount[receiverId] = (unreadCount[receiverId] ?? 0) + 1;
        }
      }

      getIt<Talker>().info(
        'Calculated unread count for chat $chatId: $unreadCount',
      );

      return Right(unreadCount);
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
        .asyncMap((snapshot) async {
          final chatList = <ChatParams>[];

          for (final doc in snapshot.docs) {
            final data = doc.data();
            final unreadCount = await calculateUnreadCount(doc.id);

            chatList.add(
              ChatParams(
                id: doc.id,
                firstUserName: data['firstUserName'] ?? 'Unknown',
                secondUserName: data['secondUserName'] ?? 'Unknown',
                firstUserId:
                    (data['participants'] != null &&
                        data['participants'].isNotEmpty)
                    ? data['participants'][0]
                    : '',
                secondUserId:
                    (data['participants'] != null &&
                        data['participants'].length > 1)
                    ? data['participants'][1]
                    : '',
                createdAt: _parseTimestamp(data['createdAt']),
                lastMessage: data['lastMessage'] ?? '',
                updatedAt: _parseTimestamp(data['updatedAt']),
                unreadCount: unreadCount.fold((l) => {}, (r) => r),
                firstUserAvatar: data['firstUserAvatar'] ?? '',
                secondUserAvatar: data['secondUserAvatar'] ?? '',
              ),
            );
          }

          return chatList;
        });
  }

  String _parseTimestamp(dynamic timestamp) {
    try {
      if (timestamp is Timestamp) {
        return timestamp.toDate().toIso8601String();
      } else if (timestamp is String) {
        return timestamp;
      } else {
        return DateTime.now().toIso8601String();
      }
    } catch (e) {
      getIt<Talker>().handle(e);
      return DateTime.now().toIso8601String();
    }
  }

  @override
  Stream<List<MessageParams>> watchMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => MessageParams.fromJson(doc.data()))
              .toList();
        });
  }
}
