import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/users/users_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/filter_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/suggest_user.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_more_menu.dart';
import 'package:telegram_copy/injections.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<UsersBloc>()..add(const UsersEvent.loadUsers()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Platform.isAndroid
              ? _buildAndroidBody(context, _searchController, _scrollController)
              : _buildAndroidBody(
                  context,
                  _searchController,
                  _scrollController,
                ),
        ),
      ),
    );
  }
}

Widget _buildAndroidBody(
  BuildContext context,
  TextEditingController searchController,
  ScrollController scrollController,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: RefreshIndicator.adaptive(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: scrollController,
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
              controller: searchController,
              hintText: 'Search...',
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverToBoxAdapter(child: FilterWidgets(selectedFilter: 'All')),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ChatListWidgets(index: index),
              childCount: 0,
            ),
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
              return state.when(
                initial: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
                loaded: (users) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SuggestUser(
                      index: index,
                      name: users[index]['name'],
                      bio: users[index]['bio'],
                    ),
                    childCount: users.length,
                  ),
                ),
                loadedMore: (users) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SuggestUser(
                      index: index,
                      name: users[index]['name'],
                      bio: users[index]['bio'],
                    ),
                    childCount: users.length,
                  ),
                ),
                error: (message) => SliverToBoxAdapter(
                  child: Center(child: Text('Error: $message')),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

// ignore: unused_element
Widget _buildIosBody(
  BuildContext context,
  TextEditingController searchController,
  ScrollController scrollController,
  String userId,
  String conversationId,
) {
  return RefreshIndicator.adaptive(
    onRefresh: () async {},
    child: CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(child: SizedBox.shrink()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: CustomAppBar(
              leftWidget: Text('WhatsApp', style: AppTextStyle.getBoldGreen()),
              rightWidget: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined),
              ),
              right2Widget: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              right3Widget: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              radius: 26,
              prefixIcon: const Icon(Icons.search),
              controller: searchController,
              hintText: 'Search...',
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 12)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: FilterWidgets(selectedFilter: 'All'),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ChatListWidgets(index: index),
              childCount: 0,
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 12)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Start chatting',
                style: AppTextStyle.getRegularBlack(),
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 12)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ChatListWidgets(index: index),
              childCount: 0,
            ),
          ),
        ),
      ],
    ),
  );
}
