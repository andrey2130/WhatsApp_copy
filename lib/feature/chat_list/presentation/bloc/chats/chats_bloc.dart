import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/create_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_meesage_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_messages_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/read_message.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/watch_chats_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/watch_message_usecase.dart';
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
  final DeleteMeesageUsecase _deleteMeesageUsecase;
  final WatchMessageUsecase _watchMessageUsecase;
  final ReadMessageUsecase _readMessageUsecase;

  final Set<String> _readMessageIds = <String>{};
  ChatsBloc({
    required LoadChatsUsecase loadChatsUsecase,
    required CreateChatUsecase createChatUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required LoadChatMessagesUsecase loadChatMessagesUsecase,
    required WatchChatsUsecase watchChatsUsecase,
    required DeleteMeesageUsecase deleteMeesageUsecase,
    required WatchMessageUsecase watchMessageUsecase,
    required ReadMessageUsecase readMessageUsecase,
  }) : _loadChatsUsecase = loadChatsUsecase,
       _createChatUsecase = createChatUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _loadChatMessagesUsecase = loadChatMessagesUsecase,
       _watchChatsUsecase = watchChatsUsecase,
       _deleteMeesageUsecase = deleteMeesageUsecase,
       _watchMessageUsecase = watchMessageUsecase,
       _readMessageUsecase = readMessageUsecase,

       super(const ChatsState.initial()) {
    on<LoadChats>(_onLoadChats);
    on<CreateChat>(_onCreateChat);
    on<SendMessage>(_onSendMessage);
    on<LoadChatMessages>(_onLoadChatMessages);
    on<WatchChats>(_onWatchChats);
    on<DeleteMessage>(_onDeleteMessage);
    on<WatchMessage>(_onWatchMessage);
    on<ReadMessage>(_onReadMessage);
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

      _readMessageIds.clear();

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

  Future<void> _onWatchMessage(
    WatchMessage event,
    Emitter<ChatsState> emit,
  ) async {
    emit(const ChatsState.loading());

    _readMessageIds.clear();

    try {
      await emit.forEach(
        _watchMessageUsecase(event.chatId),
        onData: (messages) {
          return ChatsState.messagesLoaded(messages);
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

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<ChatsState> emit,
  ) async {
    try {
      getIt<Talker>().info(
        'Deleting message: ${event.params.messageId} from chat: ${event.params.chatId}',
      );
      await _deleteMeesageUsecase(event.params);
      getIt<Talker>().info('Message deleted successfully from database');

      // Update the current state to remove the deleted message
      final currentState = state;
      currentState.maybeWhen(
        messagesLoaded: (messages) {
          final updatedMessages = messages
              .where((msg) => msg.id != event.params.messageId)
              .toList();
          getIt<Talker>().info(
            'Updated messages list: ${updatedMessages.length} messages remaining',
          );
          emit(ChatsState.messagesLoaded(updatedMessages));
        },
        chatWithMessages: (chats, messages) {
          final updatedMessages = messages
              .where((msg) => msg.id != event.params.messageId)
              .toList();
          getIt<Talker>().info(
            'Updated messages list: ${updatedMessages.length} messages remaining',
          );
          emit(
            ChatsState.chatWithMessages(
              chats: chats,
              messages: updatedMessages,
            ),
          );
        },
        orElse: () {
          // If no messages are loaded, just emit success
          getIt<Talker>().info('No messages loaded, emitting success');
          emit(const ChatsState.success());
        },
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  Future<void> _onReadMessage(
    ReadMessage event,
    Emitter<ChatsState> emit,
  ) async {
    try {
      if (_readMessageIds.contains(event.params.id)) {
        return;
      }

      await _readMessageUsecase(event.params);
      _readMessageIds.add(event.params.id);
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }
}
