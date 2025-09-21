import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/create_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_messages_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/watch_chats_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

@Injectable()
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final LoadChatsUsecase _loadChatsUsecase;
  final CreateChatUsecase _createChatUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final LoadChatMessagesUsecase _loadChatMessagesUsecase;
  final WatchChatsUsecase _watchChatsUsecase;
  ChatsBloc({
    required LoadChatsUsecase loadChatsUsecase,
    required CreateChatUsecase createChatUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required LoadChatMessagesUsecase loadChatMessagesUsecase,
    required WatchChatsUsecase watchChatsUsecase,
  }) : _loadChatsUsecase = loadChatsUsecase,
       _createChatUsecase = createChatUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _loadChatMessagesUsecase = loadChatMessagesUsecase,
       _watchChatsUsecase = watchChatsUsecase,
       super(const ChatsState.initial()) {
    on<LoadChats>(_onLoadChats);
    on<CreateChat>(_onCreateChat);
    on<SendMessage>(_onSendMessage);
    on<LoadChatMessages>(_onLoadChatMessages);
    on<WatchChats>(_onWatchChats);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      final chats = await _loadChatsUsecase(event.currentUserId);
      emit(ChatsState.loaded(chats));
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  Future<void> _onCreateChat(CreateChat event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      await _createChatUsecase(event.params);
      final chats = await _loadChatsUsecase(event.params.firstUserId);
      emit(ChatsState.loaded(chats));
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    try {
      await _sendMessageUsecase(event.params);

      final currentState = state;
      currentState.maybeWhen(
        messagesLoaded: (messages) {
          emit(ChatsState.messagesLoaded([...messages, event.params]));
        },
        chatWithMessages: (chats, messages) {
          emit(
            ChatsState.chatWithMessages(
              chats: chats,
              messages: [...messages, event.params],
            ),
          );
        },
        orElse: () {
          emit(ChatsState.messagesLoaded([event.params]));
        },
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  Future<void> _onLoadChatMessages(
    LoadChatMessages event,
    Emitter<ChatsState> emit,
  ) async {
    emit(const ChatsState.loading());
    try {
      final messages = await _loadChatMessagesUsecase(event.chatId);

      final currentState = state;
      currentState.maybeWhen(
        loaded: (chats) {
          emit(ChatsState.chatWithMessages(chats: chats, messages: messages));
        },
        chatWithMessages: (chats, _) {
          emit(ChatsState.chatWithMessages(chats: chats, messages: messages));
        },
        orElse: () {
          emit(ChatsState.messagesLoaded(messages));
        },
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  Future<void> _onWatchChats(WatchChats event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      await emit.forEach(
        _watchChatsUsecase(event.currentUserId),
        onData: (chats) {
          final currentState = state;
          return currentState.maybeWhen(
            messagesLoaded: (messages) =>
                ChatsState.chatWithMessages(chats: chats, messages: messages),
            chatWithMessages: (_, messages) =>
                ChatsState.chatWithMessages(chats: chats, messages: messages),
            orElse: () => ChatsState.loaded(chats),
          );
        },
        onError: (error, stackTrace) {
          getIt<Talker>().handle(error);
          return ChatsState.error(error.toString());
        },
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }
}
