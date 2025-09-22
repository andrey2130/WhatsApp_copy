import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/android/chat_screen_android.dart';
import 'package:telegram_copy/feature/chat_list/presentation/pages/ios/chat_screen_ios.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.userId,
    required this.userName,
    this.avatarUrl,
    required this.conversationId,
    required this.receiverIds,
  });

  final String userId;
  final String userName;
  final String? avatarUrl;
  final String conversationId;
  final List<String> receiverIds;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
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
          );
  }
}
