import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/users/users_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_more_menu.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/filter_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/suggest_user.dart';

class AndroidScreen extends StatefulWidget {
  const AndroidScreen({super.key});

  @override
  State<AndroidScreen> createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
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
          SliverToBoxAdapter(
            child: CustomAppBar(
              leftWidget: Text('WhatsApp', style: AppTextStyle.getBoldGreen()),
              rightWidget: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              right2Widget: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              right3Widget: ChatListMoreMenu(
                onSelected: (action) {
                  switch (action) {
                    case ChatListMoreAction.settings:
                      context.push('/settings');
                      break;
                    case ChatListMoreAction.newGroup:
                      break;
                    case ChatListMoreAction.newBroadcast:
                      break;
                    case ChatListMoreAction.linkedDevices:
                      break;
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomTextField(
              radius: 26,
              prefixIcon: const Icon(Icons.search),
              controller: _searchController,
              hintText: 'Search...',
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
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