import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';

abstract class ChatRepo {
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

  Future<Either<Failure, MessageParams>> sendPhoto(
    MessageParams params,
    Uint8List file,
  );

  Stream<List<MessageParams>> watchMessages(String chatId);
  Stream<List<ChatParams>> watchChats(String currentUserId);
}
