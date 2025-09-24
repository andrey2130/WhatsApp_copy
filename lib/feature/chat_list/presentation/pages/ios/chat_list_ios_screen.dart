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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<ChatsBloc>().add(
            ChatsEvent.loadChats(
              context.read<AuthBloc>().state.maybeWhen(
                authenticated: (userId) => userId,
                orElse: () => '',
              ),
            ),
          );
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
            SliverToBoxAdapter(child: FilterWidgets(selectedFilter: 'All')),

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
                  loaded: (chats) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => SuggestUser(
                        index: index,
                        uid: chats[index]['uid'],
                        name: chats[index]['name'],
                        bio: chats[index]['bio'],
                        user: UserParams.fromJson(chats[index]),
                      ),
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
          ],
        ),
      ),
    );
  }
}
