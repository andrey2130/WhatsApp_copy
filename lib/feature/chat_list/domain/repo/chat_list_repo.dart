import 'package:dartz/dartz.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

abstract class ChatListRepo {
  Future<Either<Failure, List<UserParams>>> getAllUsers();
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
