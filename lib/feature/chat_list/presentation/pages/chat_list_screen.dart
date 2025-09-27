import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/users/users_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/android/chat_list_android_screen.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/ios/chat_list_ios_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;
      authState.maybeWhen(
        authenticated: (userId) {
          context.read<ChatsBloc>().add(ChatsEvent.watchChats(userId));
        },
        orElse: () {},
      );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<UsersBloc>()..add(const UsersEvent.loadUsers()),
        ),
        BlocProvider(create: (context) => getIt<ChatsBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, authState) {
          authState.maybeWhen(
            loading: () {},
            authenticated: (userId) {
              context.read<ChatsBloc>().add(ChatsEvent.loadChats(userId, null));
              context.read<ChatsBloc>().add(ChatsEvent.watchChats(userId));
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: Platform.isAndroid
                ? const AndroidScreen()
                : const IosScreen(),
          ),
        ),
      ),
    );
  }
}
