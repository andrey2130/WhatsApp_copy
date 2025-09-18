import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/data/datasource/chat_list_datasource.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_list_repo.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

@Injectable(as: ChatListRepo)
class ChatListRepoImpl implements ChatListRepo {
  final ChatListDatasource _chatListDatasource;

  ChatListRepoImpl({required ChatListDatasource chatListDatasource})
    : _chatListDatasource = chatListDatasource;

  @override
  Future<Either<Failure, List<UserParams>>> getAllUsers() async {
    try {
      final result = await _chatListDatasource.getAllUsers();
      getIt<Talker>().info('All users loaded: $result');
      return Right(result);
    } catch (e) {
      getIt<Talker>().handle(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteConversation({
    required String conversationId,
  }) {
    return _chatListDatasource
        .deleteConversation(conversationId: conversationId)
        .then((result) {
          result.fold(
            (failure) => getIt<Talker>().error(
              'Delete conversation failed: ${failure.message}',
            ),
            (_) =>
                getIt<Talker>().info('Conversation deleted: $conversationId'),
          );
          return result;
        });
  }

  @override
  Future<Either<Failure, void>> deleteMessage({required String messageId}) {
    return _chatListDatasource.deleteMessage(messageId: messageId).then((
      result,
    ) {
      result.fold(
        (failure) =>
            getIt<Talker>().error('Delete message failed: ${failure.message}'),
        (_) => getIt<Talker>().info('Message deleted: $messageId'),
      );
      return result;
    });
  }

  @override
  Future<Either<Failure, List<ConversationParams>>> getAllConversations() {
    return _chatListDatasource.getAllConversations().then((result) {
      result.fold(
        (failure) => getIt<Talker>().error(
          'Get all conversations failed: ${failure.message}',
        ),
        (_) =>
            getIt<Talker>().info('All conversations loaded: ${result.length}'),
      );
      return result;
    });
  }

  @override
  Future<Either<Failure, List<MessageParams>>> getAllMessages() {
    return _chatListDatasource.getAllMessages().then((result) {
      result.fold(
        (failure) => getIt<Talker>().error(
          'Get all messages failed: ${failure.message}',
        ),
        (_) => getIt<Talker>().info('All messages loaded: ${result.length}'),
      );
      return result;
    });
  }

  @override
  Future<Either<Failure, void>> sendConversation({
    required ConversationParams conversation,
  }) {
    return _chatListDatasource
        .sendConversation(conversation: conversation)
        .then((result) {
          result.fold(
            (failure) => getIt<Talker>().error(
              'Send conversation failed: ${failure.message}',
            ),
            (_) => getIt<Talker>().info(
              'Conversation created: ${conversation.toString()}',
            ),
          );
          return result;
        });
  }

  @override
  Future<Either<Failure, void>> sendMessage({required MessageParams message}) {
    return _chatListDatasource.sendMessage(message: message).then((result) {
      result.fold(
        (failure) =>
            getIt<Talker>().error('Send message failed: ${failure.message}'),
        (_) => getIt<Talker>().info('Message sent: ${message.toString()}'),
      );
      return result;
    });
  }

  @override
  Future<Either<Failure, void>> updateConversation({
    required ConversationParams conversation,
  }) {
    return _chatListDatasource
        .updateConversation(conversation: conversation)
        .then((result) {
          result.fold(
            (failure) => getIt<Talker>().error(
              'Update conversation failed: ${failure.message}',
            ),
            (_) => getIt<Talker>().info(
              'Conversation updated: ${conversation.toString()}',
            ),
          );
          return result;
        });
  }

  @override
  Future<Either<Failure, void>> updateMessage({
    required MessageParams message,
  }) {
    return _chatListDatasource.updateMessage(message: message).then((result) {
      result.fold(
        (failure) =>
            getIt<Talker>().error('Update message failed: ${failure.message}'),
        (_) => getIt<Talker>().info('Message updated: ${message.toString()}'),
      );
      return result;
    });
  }

  @override
  Stream<List<ConversationParams>> conversationsStream() {
    return _chatListDatasource.conversationsStream();
  }

  @override
  Stream<List<MessageParams>> messagesStream({required String conversationId}) {
    return _chatListDatasource.messagesStream(conversationId: conversationId);
  }
}
