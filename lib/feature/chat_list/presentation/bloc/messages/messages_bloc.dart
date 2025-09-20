import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/create_message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/delete_message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/subscribe_messages_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_messages.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/create_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/update_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_message_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/subscribe_messages_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

@Injectable()
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final GetAllMessagesUsecase _getAllMessagesUsecase;
  final CreateMessageUsecase _createMessageUsecase;
  final UpdateMessageUsecase _updateMessageUsecase;
  final DeleteMessageUsecase _deleteMessageUsecase;
  final SubscribeMessagesUsecase _subscribeMessagesUsecase;

  MessagesBloc({
    required GetAllMessagesUsecase getAllMessagesUsecase,
    required CreateMessageUsecase createMessageUsecase,
    required UpdateMessageUsecase updateMessageUsecase,
    required DeleteMessageUsecase deleteMessageUsecase,
    required SubscribeMessagesUsecase subscribeMessagesUsecase,
  }) : _getAllMessagesUsecase = getAllMessagesUsecase,
       _createMessageUsecase = createMessageUsecase,
       _updateMessageUsecase = updateMessageUsecase,
       _deleteMessageUsecase = deleteMessageUsecase,
       _subscribeMessagesUsecase = subscribeMessagesUsecase,
       super(const MessagesState.initial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<UpdateMessage>(_onUpdateMessage);
    on<DeleteMessage>(_onDeleteMessage);
    on<SubscribeMessages>(_onSubscribeMessages);
  }

  Future<void> _onLoadMessages(
    LoadMessages event,
    Emitter<MessagesState> emit,
  ) async {
    emit(const MessagesState.loading());
    try {
      final messages = await _getAllMessagesUsecase(NoParams());
      emit(MessagesState.success(messages));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(MessagesState.error(e.toString()));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<MessagesState> emit,
  ) async {
    try {
      await _createMessageUsecase(
        CreateMessageParams(
          id: event.message.id,
          content: event.message.content,
          conversationId: event.message.conversationId,
          senderId: event.message.senderId,
        ),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(MessagesState.error(e.toString()));
    }
  }

  Future<void> _onUpdateMessage(
    UpdateMessage event,
    Emitter<MessagesState> emit,
  ) async {
    try {
      await _updateMessageUsecase(event.message);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<MessagesState> emit,
  ) async {
    try {
      await _deleteMessageUsecase(
        DeleteMessageParams(messageId: event.messageId),
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onSubscribeMessages(
    SubscribeMessages event,
    Emitter<MessagesState> emit,
  ) async {
    emit(const MessagesState.loading());
    try {
      final stream = await _subscribeMessagesUsecase(
        SubscribeMessagesParams(conversationId: event.conversationId),
      );
      await emit.onEach<List<MessageParams>>(
        stream,
        onData: (messages) {
          emit(MessagesState.success(messages));
        },
        onError: (e, st) {
          getIt<Talker>().handle(e, st);
          emit(MessagesState.error(e.toString()));
        },
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(MessagesState.error(e.toString()));
    }
  }
}
