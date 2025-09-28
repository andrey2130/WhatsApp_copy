import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_screen/chat_screen_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/android/chat_screen_android.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/ios/chat_screen_ios.dart';
import 'package:telegram_copy/injections.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    required this.userId,
    required this.userName,
    required this.conversationId,
    required this.receiverIds,
    super.key,
    this.avatarUrl,
  });

  final String userId;
  final String userName;
  final String? avatarUrl;
  final String conversationId;
  final List<String> receiverIds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatScreenBloc>(),
      child: Platform.isAndroid
          ? ChatScreenAndroid(
              userId: userId,
              userName: userName,
              avatarUrl: avatarUrl,
              conversationId: conversationId,
              receiverIds: receiverIds,
            )
          : ChatScreenIos(
              userId: userId,
              userName: userName,
              avatarUrl: avatarUrl,
              conversationId: conversationId,
              receiverIds: receiverIds,
            ),
    );
  }
}
