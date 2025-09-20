import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/usecases/usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/get_all_conversations.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/send_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/update_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/delete_conversation_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/subscribe_conversations_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'conversations_event.dart';
part 'conversations_state.dart';
part 'conversations_bloc.freezed.dart';

@Injectable()
class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final GetAllConversationsUsecase _getAllConversationsUsecase;
  final SendConversationUsecase _sendConversationUsecase;
  final UpdateConversationUsecase _updateConversationUsecase;
  final DeleteConversationUsecase _deleteConversationUsecase;
  final SubscribeConversationsUsecase _subscribeConversationsUsecase;

  ConversationsBloc({
    required GetAllConversationsUsecase getAllConversationsUsecase,
    required SendConversationUsecase sendConversationUsecase,
    required UpdateConversationUsecase updateConversationUsecase,
    required DeleteConversationUsecase deleteConversationUsecase,
    required SubscribeConversationsUsecase subscribeConversationsUsecase,
  }) : _getAllConversationsUsecase = getAllConversationsUsecase,
       _sendConversationUsecase = sendConversationUsecase,
       _updateConversationUsecase = updateConversationUsecase,
       _deleteConversationUsecase = deleteConversationUsecase,
       _subscribeConversationsUsecase = subscribeConversationsUsecase,
       super(const ConversationsState.initial()) {
    on<LoadConversations>(_onLoadConversations);
    on<SendConversation>(_onSendConversation);
    on<UpdateConversation>(_onUpdateConversation);
    on<DeleteConversation>(_onDeleteConversation);
    on<SubscribeConversations>(_onSubscribeConversations);
  }

  Future<void> _onLoadConversations(
    LoadConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(const ConversationsState.loading());
    try {
      final conversations = await _getAllConversationsUsecase(NoParams());
      emit(ConversationsState.success(conversations));
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(ConversationsState.error(e.toString()));
    }
  }

  Future<void> _onSendConversation(
    SendConversation event,
    Emitter<ConversationsState> emit,
  ) async {
    try {
      await _sendConversationUsecase(event.conversation);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onUpdateConversation(
    UpdateConversation event,
    Emitter<ConversationsState> emit,
  ) async {
    try {
      await _updateConversationUsecase(event.conversation);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onDeleteConversation(
    DeleteConversation event,
    Emitter<ConversationsState> emit,
  ) async {
    try {
      await _deleteConversationUsecase(event.conversationId);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
    }
  }

  Future<void> _onSubscribeConversations(
    SubscribeConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(const ConversationsState.loading());
    try {
      final stream = await _subscribeConversationsUsecase(NoParams());
      await emit.onEach<List<ConversationParams>>(
        stream,
        onData: (conversations) {
          emit(ConversationsState.success(conversations));
        },
        onError: (e, st) {
          getIt<Talker>().handle(e, st);
          emit(ConversationsState.error(e.toString()));
        },
      );
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      emit(ConversationsState.error(e.toString()));
    }
  }
}
