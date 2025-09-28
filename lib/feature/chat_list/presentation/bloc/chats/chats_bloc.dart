import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/create_chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/create_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/load_chat_usecase.dart';
import 'package:telegram_copy/feature/chat_list/domain/usecases/watch_chats_usecase.dart';
import 'package:telegram_copy/injections.dart';

part 'chats_bloc.freezed.dart';
part 'chats_event.dart';
part 'chats_state.dart';

@Injectable()
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final LoadChatsUsecase _loadChatsUsecase;
  final CreateChatUsecase _createChatUsecase;
  final WatchChatsUsecase _watchChatsUsecase;

  ChatsBloc({
    required LoadChatsUsecase loadChatsUsecase,
    required CreateChatUsecase createChatUsecase,
    required WatchChatsUsecase watchChatsUsecase,
  }) : _loadChatsUsecase = loadChatsUsecase,
       _createChatUsecase = createChatUsecase,
       _watchChatsUsecase = watchChatsUsecase,
       super(const ChatsState.initial()) {
    on<LoadChats>(_onLoadChats);
    on<CreateChat>(_onCreateChat);
    on<WatchChats>(_onWatchChats);
  }

  int getTotalUnreadCount(List<ChatParams> chats, String currentUserId) {
    int total = 0;
    for (final chat in chats) {
      total += chat.unreadCount[currentUserId] ?? 0;
    }
    return total;
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      final chats = await _loadChatsUsecase(event.currentUserId);
      final filteredChats = _applyFilter(
        chats,
        event.filter,
        event.currentUserId,
      );
      emit(ChatsState.loaded(filteredChats));
    } catch (e) {
      getIt<Talker>().handle(e);
      emit(ChatsState.error(e.toString()));
    }
  }

  List<ChatParams> _applyFilter(
    List<ChatParams> chats,
    String? filter,
    String currentUserId,
  ) {
    if (filter == null || filter == 'All') return chats;

    switch (filter) {
      case 'Unread':
        return chats
            .where((c) => (c.unreadCount[currentUserId] ?? 0) > 0)
            .toList();
      case 'Favorites':
        return chats.where((c) => c.isFavorite).toList();
      case 'Groups':
        return chats.where((c) => c.isGroup).toList();
      default:
        return chats;
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

  Future<void> _onWatchChats(WatchChats event, Emitter<ChatsState> emit) async {
    emit(const ChatsState.loading());
    try {
      await emit.forEach(
        _watchChatsUsecase(event.currentUserId),
        onData: (chats) {
          return ChatsState.loaded(chats);
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
