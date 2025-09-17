import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_list_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/filter_widgets.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/suggest_user.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_list_more_menu.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _hasLoadedUsers = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasLoadedUsers) {
        context.read<ChatListBloc>().add(const ChatListEvent.loadUsers());
        _hasLoadedUsers = true;
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Platform.isAndroid
            ? _buildAndroidBody(context, _searchController, _scrollController)
            : _buildAndroidBody(context, _searchController, _scrollController),
      ),
    );
  }
}

Widget _buildIosBody(
  BuildContext context,
  TextEditingController searchController,
  ScrollController scrollController,
) {
  return RefreshIndicator.adaptive(
    onRefresh: () async {
      context.read<ChatListBloc>().add(const ChatListEvent.loadUsers());
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
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
          SliverToBoxAdapter(
            child: CustomTextField(
              radius: 26,
              prefixIcon: Icon(Icons.search),
              controller: searchController,
              hintText: 'Search...',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: BlocBuilder<ChatListBloc, ChatListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (selectedFilter) =>
                      FilterWidgets(selectedFilter: selectedFilter),
                  orElse: () => FilterWidgets(selectedFilter: 'All'),
                );
              },
            ),
          ),
          SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const ChatListWidgets(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Start chatting',
                style: AppTextStyle.getRegularBlack(),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, state) {
              final userCount = state.maybeWhen(
                success: (users) => users.length,
                orElse: () => 0,
              );
              return SliverList.builder(
                itemCount: userCount,
                itemBuilder: (context, index) => SuggestUser(index: index),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildAndroidBody(
  BuildContext context,
  TextEditingController searchController,
  ScrollController scrollController,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<ChatListBloc>().add(const ChatListEvent.loadUsers());
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
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
              prefixIcon: Icon(Icons.search),
              controller: searchController,
              hintText: 'Search...',
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: BlocBuilder<ChatListBloc, ChatListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (selectedFilter) =>
                      FilterWidgets(selectedFilter: selectedFilter),
                  orElse: () => FilterWidgets(selectedFilter: 'All'),
                );
              },
            ),
          ),
          SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const ChatListWidgets(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Start chatting',
                style: AppTextStyle.getRegularBlack(),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, state) {
              final userCount = state.maybeWhen(
                success: (users) => users.length,
                orElse: () => 0,
              );
              return SliverList.builder(
                itemCount: userCount,
                itemBuilder: (context, index) => SuggestUser(index: index),
              );
            },
          ),
        ],
      ),
    ),
  );
}
