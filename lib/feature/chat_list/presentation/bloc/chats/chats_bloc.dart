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
  ChatsBloc({
    required LoadChatsUsecase loadChatsUsecase,
    required CreateChatUsecase createChatUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required LoadChatMessagesUsecase loadChatMessagesUsecase,
  }) : _loadChatsUsecase = loadChatsUsecase,
       _createChatUsecase = createChatUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _loadChatMessagesUsecase = loadChatMessagesUsecase,
       super(const ChatsState.initial()) {
    on<LoadChats>(_onLoadChats);
    on<CreateChat>(_onCreateChat);
    on<SendMessage>(_onSendMessage);
    on<LoadChatMessages>(_onLoadChatMessages);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      final chats = await _loadChatsUsecase(());
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
      final chats = await _loadChatsUsecase(());
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

      final currentMessages = state.maybeWhen(
        messagesLoaded: (messages) => messages,
        orElse: () => [],
      );

      emit(ChatsState.messagesLoaded([...currentMessages, event.params]));
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
      emit(ChatsState.messagesLoaded(messages));
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }
}
