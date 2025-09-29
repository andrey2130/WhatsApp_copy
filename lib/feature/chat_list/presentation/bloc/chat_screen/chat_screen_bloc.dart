import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_meesage_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_messages_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/read_message.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_photo_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/watch_message_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'chat_screen_bloc.freezed.dart';
part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

@Injectable()
class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final LoadChatMessagesUsecase _loadChatMessagesUsecase;
  final WatchMessageUsecase _watchMessageUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final SendPhotoUsecase _sendPhotoUsecase;
  final DeleteMeesageUsecase _deleteMeesageUsecase;
  final ReadMessageUsecase _readMessageUsecase;

  ChatScreenBloc({
    required LoadChatMessagesUsecase loadChatMessagesUsecase,
    required WatchMessageUsecase watchMessageUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required SendPhotoUsecase sendPhotoUsecase,
    required DeleteMeesageUsecase deleteMeesageUsecase,
    required ReadMessageUsecase readMessageUsecase,
  }) : _loadChatMessagesUsecase = loadChatMessagesUsecase,
       _watchMessageUsecase = watchMessageUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _sendPhotoUsecase = sendPhotoUsecase,
       _deleteMeesageUsecase = deleteMeesageUsecase,
       _readMessageUsecase = readMessageUsecase,
       super(const ChatScreenState.initial()) {
    on<LoadMessages>(_onLoadMessages);
    on<WatchMessages>(_onWatchMessages);
    on<SendMessage>(_onSendMessage);
    on<SendPhoto>(_onSendPhoto);
    on<DeleteMessage>(_onDeleteMessage);
    on<ReadMessage>(_onReadMessage);
    on<SetReplyMode>(_onSetReplyMode);
    on<ClearReplyMode>(_onClearReplyMode);
    on<ScrollToMessage>(_onScrollToMessage);
    on<ClearHighlight>(_onClearHighlight);
  }

  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<ChatScreenState> emit,
  ) async {
    emit(const ChatScreenState.loading());
    try {
      final messages = await _loadChatMessagesUsecase(event.chatId);
      emit(ChatScreenState.loaded(messages: messages));
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatScreenState.error(e.toString()));
    }
  }

  Future<void> _onWatchMessages(
    WatchMessages event,
    Emitter<ChatScreenState> emit,
  ) async {
    try {
      await emit.forEach(
        _watchMessageUsecase(event.chatId),
        onData: (messages) {
          return ChatScreenState.loaded(messages: messages);
        },
      );
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatScreenState.error(e.toString()));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatScreenState> emit,
  ) async {
    try {
      await _sendMessageUsecase(event.message);
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatScreenState.error(e.toString()));
    }
  }

  Future<void> _onSendPhoto(
    SendPhoto event,
    Emitter<ChatScreenState> emit,
  ) async {
    try {
      await _sendPhotoUsecase(event.message, event.file);
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatScreenState.error(e.toString()));
    }
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<ChatScreenState> emit,
  ) async {
    try {
      await _deleteMeesageUsecase(event.params);
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatScreenState.error(e.toString()));
    }
  }

  Future<void> _onReadMessage(
    ReadMessage event,
    Emitter<ChatScreenState> emit,
  ) async {
    try {
      await _readMessageUsecase(event.message);
    } catch (e) {
      getIt<Talker>().handle(e);
    }
  }

  void _onSetReplyMode(SetReplyMode event, Emitter<ChatScreenState> emit) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(
        currentState.copyWith(isReplyMode: true, replyToMessage: event.message),
      );
    }
  }

  void _onClearReplyMode(ClearReplyMode event, Emitter<ChatScreenState> emit) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(isReplyMode: false, replyToMessage: null));
    }
  }

  void _onScrollToMessage(
    ScrollToMessage event,
    Emitter<ChatScreenState> emit,
  ) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(
        currentState.copyWith(
          isScrollingToMessage: true,
          highlightedMessageId: event.messageId,
        ),
      );
    }
  }

  void _onClearHighlight(ClearHighlight event, Emitter<ChatScreenState> emit) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(
        currentState.copyWith(
          isScrollingToMessage: false,
          highlightedMessageId: null,
        ),
      );
    }
  }
}
