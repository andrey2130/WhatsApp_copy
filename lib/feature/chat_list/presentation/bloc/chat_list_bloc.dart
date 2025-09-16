import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';
part 'chat_list_bloc.freezed.dart';

@injectable
class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(const ChatListState.loaded(selectedFilter: 'All')) {
    on<ChatListEvent>((event, emit) {
      event.when(
        started: () => emit(const ChatListState.loaded(selectedFilter: 'All')),
        filterChanged: (filter) =>
            emit(ChatListState.loaded(selectedFilter: filter)),
      );
    });
  }
}
