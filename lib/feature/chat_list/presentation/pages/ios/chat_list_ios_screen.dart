import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/users/users_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/filter_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/suggest_user.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

class IosScreen extends StatefulWidget {
  const IosScreen({super.key});

  @override
  State<IosScreen> createState() => _IosScreenState();
}

class _IosScreenState extends State<IosScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  void _applyFilter(String filter, String currentUserId) {
    setState(() {
      _selectedFilter = filter;
    });
    context.read<ChatsBloc>().add(ChatsEvent.loadChats(currentUserId, filter));
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final currentUserId = authState.maybeWhen(
      authenticated: (userId) => userId,
      orElse: () => '',
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<ChatsBloc>().add(
            ChatsEvent.loadChats(currentUserId, _selectedFilter),
          );
          context.read<UsersBloc>().add(const UsersEvent.loadUsers());
        },
        child: CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Colors.white,
              leading: const Icon(CupertinoIcons.ellipsis),
              largeTitle: const Text('Chats'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.camera_fill),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.add),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: 'Search...',
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),

            /// 🔹 тут ми будуємо FilterWidgets і передаємо реальний unreadCount
            BlocBuilder<ChatsBloc, ChatsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (chats) {
                    final unreadCount = chats.fold<int>(
                      0,
                      (sum, chat) =>
                          sum + (chat.unreadCount[currentUserId] ?? 0),
                    );

                    return SliverToBoxAdapter(
                      child: FilterWidgets(
                        selectedFilter: _selectedFilter,
                        onFilterSelected: (filter) =>
                            _applyFilter(filter, currentUserId),
                        unReadCount: unreadCount,
                      ),
                    );
                  },
                  orElse: () => SliverToBoxAdapter(
                    child: FilterWidgets(
                      selectedFilter: _selectedFilter,
                      onFilterSelected: (filter) =>
                          _applyFilter(filter, currentUserId),
                      unReadCount: 0,
                    ),
                  ),
                );
              },
            ),

            BlocBuilder<ChatsBloc, ChatsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (chats) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          ChatListWidgets(index: index, chat: chats[index]),
                      childCount: chats.length,
                    ),
                  ),
                  error: (message) => SliverToBoxAdapter(
                    child: Center(child: Text('Error: $message')),
                  ),
                  orElse: () =>
                      const SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),

            const SliverPadding(padding: EdgeInsets.only(top: 12)),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Start chatting',
                  style: AppTextStyle.getRegularBlack(),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 12)),
            BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (users) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => SuggestUser(
                        index: index,
                        uid: users[index]['uid'] as String? ?? '',
                        name: users[index]['name'] as String? ?? '',
                        bio: users[index]['bio'] as String? ?? '',
                        user: UserParams.fromJson(users[index]),
                      ),
                      childCount: users.length,
                    ),
                  ),
                  error: (message) => SliverToBoxAdapter(
                    child: Center(child: Text('Error: $message')),
                  ),
                  orElse: () =>
                      const SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
