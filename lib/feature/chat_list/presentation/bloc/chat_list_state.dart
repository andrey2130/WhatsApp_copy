part of 'chat_list_bloc.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = _Initial;
  const factory ChatListState.loaded({required String selectedFilter}) =
      _Loaded;
}
