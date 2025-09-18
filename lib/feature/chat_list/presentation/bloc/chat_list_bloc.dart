import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'dart:async';

import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/subscribe_messages_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_conversations.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_messages.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/update_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/update_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/subscribe_conversations_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/subscribe_messages_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';
part 'chat_list_bloc.freezed.dart';

@Injectable()
class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetAllConversationsUsecase _getAllConversationsUsecase;
  final GetAllMessagesUsecase _getAllMessagesUsecase;
  final SendConversationUsecase _sendConversationUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final UpdateConversationUsecase _updateConversationUsecase;
  final UpdateMessageUsecase _updateMessageUsecase;
  final DeleteConversationUsecase _deleteConversationUsecase;
  final DeleteMessageUsecase _deleteMessageUsecase;
  final SubscribeConversationsUsecase _subscribeConversationsUsecase;
  final SubscribeMessagesUsecase _subscribeMessagesUsecase;
  List<ConversationParams> _conversationsCache = [];
  Stream<List<ConversationParams>>? _conversationsStream;
  Stream<List<MessageParams>>? _messagesStream;
  StreamSubscription<List<ConversationParams>>? _conversationsSub;
  StreamSubscription<List<MessageParams>>? _messagesSub;

  ChatListBloc({
    required GetAllConversationsUsecase getAllConversationsUsecase,
    required GetAllMessagesUsecase getAllMessagesUsecase,
    required SendConversationUsecase sendConversationUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required UpdateConversationUsecase updateConversationUsecase,
    required UpdateMessageUsecase updateMessageUsecase,
    required DeleteConversationUsecase deleteConversationUsecase,
    required DeleteMessageUsecase deleteMessageUsecase,
    required SubscribeConversationsUsecase subscribeConversationsUsecase,
    required SubscribeMessagesUsecase subscribeMessagesUsecase,
  }) : _getAllConversationsUsecase = getAllConversationsUsecase,
       _getAllMessagesUsecase = getAllMessagesUsecase,
       _sendConversationUsecase = sendConversationUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _updateConversationUsecase = updateConversationUsecase,
       _updateMessageUsecase = updateMessageUsecase,
       _deleteConversationUsecase = deleteConversationUsecase,
       _deleteMessageUsecase = deleteMessageUsecase,
       _subscribeConversationsUsecase = subscribeConversationsUsecase,
       _subscribeMessagesUsecase = subscribeMessagesUsecase,
       super(const ChatListState.initial()) {
    on<LoadAllConversations>(_onLoadAllConversations);
    on<LoadAllMessages>(_onLoadAllMessages);
    on<SendConversation>(_onSendConversation);
    on<SendMessage>(_onSendMessage);
    on<UpdateConversation>(_onUpdateConversation);
    on<UpdateMessage>(_onUpdateMessage);
    on<DeleteConversation>(_onDeleteConversation);
    on<DeleteMessage>(_onDeleteMessage);
    on<SubscribeConversations>(_onSubscribeConversations);
    on<SubscribeMessages>(_onSubscribeMessages);
    on<FilterChanged>(_onFilterChanged);
  }

  Future<void> _onLoadAllConversations(
    LoadAllConversations event,
    Emitter<ChatListState> emit,
  ) async {
    emit(const ChatListState.conversationsLoading());
    try {
      final conversations = await _getAllConversationsUsecase(NoParams());
      _conversationsCache = conversations;
      emit(ChatListState.conversationsSuccess(conversations: conversations));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(ChatListState.conversationsError(message: e.toString()));
    }
  }

  Future<void> _onLoadAllMessages(
    LoadAllMessages event,
    Emitter<ChatListState> emit,
  ) async {
    emit(
      ChatListState.messagesLoading(
        conversationId: '',
        conversations: _conversationsCache,
      ),
    );
    try {
      final messages = await _getAllMessagesUsecase(NoParams());
      emit(
        ChatListState.messagesSuccess(
          conversationId: '',
          conversations: _conversationsCache,
          messages: messages,
        ),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(
        ChatListState.messagesError(conversationId: '', message: e.toString()),
      );
    }
  }

  Future<void> _onSendConversation(
    SendConversation event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _sendConversationUsecase(event.conversation);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _sendMessageUsecase(event.message);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onUpdateConversation(
    UpdateConversation event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _updateConversationUsecase(event.conversation);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onUpdateMessage(
    UpdateMessage event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _updateMessageUsecase(event.message);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onDeleteConversation(
    DeleteConversation event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _deleteConversationUsecase(
        DeleteConversationParams(conversationId: event.conversationId),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _deleteMessageUsecase(
        DeleteMessageParams(messageId: event.messageId),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onSubscribeConversations(
    SubscribeConversations event,
    Emitter<ChatListState> emit,
  ) async {
    await _conversationsSub?.cancel();
    _conversationsSub = null;
    emit(const ChatListState.conversationsLoading());
    try {
      _conversationsStream = await _subscribeConversationsUsecase(NoParams());
      await emit.onEach<List<ConversationParams>>(
        _conversationsStream!,
        onData: (list) {
          _conversationsCache = list;
          emit(ChatListState.conversationsSuccess(conversations: list));
        },
        onError: (e, st) {
          getIt<Talker>().handle(e, st);
          emit(ChatListState.conversationsError(message: e.toString()));
        },
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(ChatListState.conversationsError(message: e.toString()));
    }
  }

  Future<void> _onSubscribeMessages(
    SubscribeMessages event,
    Emitter<ChatListState> emit,
  ) async {
    await _messagesSub?.cancel();
    _messagesSub = null;
    emit(
      ChatListState.messagesLoading(
        conversationId: event.conversationId,
        conversations: _conversationsCache,
      ),
    );
    try {
      _messagesStream = await _subscribeMessagesUsecase(
        SubscribeMessagesParams(conversationId: event.conversationId),
      );
      await emit.onEach<List<MessageParams>>(
        _messagesStream!,
        onData: (list) {
          emit(
            ChatListState.messagesSuccess(
              conversationId: event.conversationId,
              conversations: _conversationsCache,
              messages: list,
            ),
          );
        },
        onError: (e, st) {
          getIt<Talker>().handle(e, st);
          emit(
            ChatListState.messagesError(
              conversationId: event.conversationId,
              message: e.toString(),
            ),
          );
        },
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(
        ChatListState.messagesError(
          conversationId: event.conversationId,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _conversationsSub?.cancel();
    await _messagesSub?.cancel();
    return super.close();
  }

  Future<void> _onFilterChanged(
    FilterChanged event,
    Emitter<ChatListState> emit,
  ) async {
    emit(ChatListState.filterChanged(filter: event.filter));
  }
}
