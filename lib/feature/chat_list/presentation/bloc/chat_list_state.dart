part of 'chat_list_bloc.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = Initial;
  const factory ChatListState.loading() = Loading;
  const factory ChatListState.loaded({required String selectedFilter}) =
      Loaded;
  const factory ChatListState.error({required String message}) = Error;
  const factory ChatListState.success({required List<UserParams> users}) =
      Success;
}
