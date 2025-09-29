// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegram_copy/core/utils/image_picker.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_screen/chat_screen_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_navigation_bar.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_screen/chat_input_widget.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_screen/chat_messages_list.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:uuid/uuid.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({
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
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final Map<String, GlobalKey> _messageKeys = {};

  bool _hasScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatScreenBloc>().add(
      ChatScreenEvent.loadMessages(widget.conversationId),
    );
    context.read<ChatScreenBloc>().add(
      ChatScreenEvent.watchMessages(widget.conversationId),
    );
    context.read<SettingsBloc>().add(const SettingsEvent.loadRequested());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatScreenBloc, ChatScreenState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded:
              (
                messages,
                isReplyMode,
                replyToMessage,
                isScrollingToMessage,
                highlightedMessageId,
              ) {
                // Не скролити автоматично в listener - це створює конфлікт
              },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                ChatNavigationBar(
                  userName: widget.userName,
                  avatarUrl: widget.avatarUrl,
                  onBack: () => context.pop(),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/whatsAppBack.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          loaded:
                              (
                                messages,
                                isReplyMode,
                                replyToMessage,
                                isScrollingToMessage,
                                highlightedMessageId,
                              ) => ChatMessagesList(
                                messages: messages,
                                currentUserId: widget.userId,
                                scrollController: _scrollController,
                                messageKeys: _messageKeys,
                                highlightedMessageId: highlightedMessageId,
                                onReplyMessage: _replyMessage,
                                onDeleteMessage: _deleteMessage,
                                onReadMessage: _readMessage,
                                onScrollToMessage: _scrollToMessage,
                                hasScrolledToBottom: _hasScrolledToBottom,
                                onFirstScroll: () {
                                  setState(() {
                                    _hasScrolledToBottom = true;
                                  });
                                },
                              ),
                          error: (message) => Center(child: Text(message)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ChatInputWidget(
                          messageController: _messageController,
                          focusNode: _focusNode,
                          onSendMessage: _sendMessage,
                          onPickPhoto: _pickAndSendPhoto,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollToMessage(String id) {
    final key = _messageKeys[id];
    final ctx = key?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5,
      ).then((_) {
        context.read<ChatScreenBloc>().add(ChatScreenEvent.scrollToMessage(id));
        Future.delayed(const Duration(milliseconds: 900), () {
          if (mounted) {
            context.read<ChatScreenBloc>().add(
              const ChatScreenEvent.clearHighlight(),
            );
          }
        });
      });
    }
  }

  void _replyMessage(MessageParams message) {
    context.read<ChatScreenBloc>().add(ChatScreenEvent.setReplyMode(message));
    _focusNode.requestFocus();
  }

  String getReceiverPhotoUrl(String currentUserId, ChatParams chat) {
    if (currentUserId == chat.firstUserId) {
      return chat.secondUserAvatar;
    } else {
      return chat.firstUserAvatar;
    }
  }

  String _getCurrentAvatar() {
    return context.read<SettingsBloc>().state.maybeWhen(
      success: (user) => user.photoUrl,
      orElse: () => '',
    );
  }

  Future<void> _pickAndSendPhoto({bool fromCamera = false}) async {
    final source = fromCamera ? ImageSource.camera : ImageSource.gallery;

    final filePath = await ImagePickerHelper.pickImagePath(source);

    if (filePath != null && mounted) {
      final fileBytes = await File(filePath).readAsBytes();

      final message = MessageParams(
        id: const Uuid().v4(),
        senderName: _getCurrentUserName(),
        receiverName: widget.userName,
        message: '', 
        firstUserAvatar: _getCurrentAvatar(),
        secondUserAvatar: widget.avatarUrl ?? '',
        senderId: widget.userId,
        receiverId: widget.receiverIds.first,
        chatId: widget.conversationId,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        imageUrl: filePath,
      );
      if (!mounted) return;
      context.read<ChatScreenBloc>().add(
        ChatScreenEvent.sendPhoto(message, fileBytes),
      );
    }
  }

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    final currentState = context.read<ChatScreenBloc>().state;

    context.read<ChatScreenBloc>().add(
      ChatScreenEvent.sendMessage(
        MessageParams(
          id: const Uuid().v4(),
          senderName: _getCurrentUserName(),
          receiverName: widget.userName,
          message: message.trim(),
          firstUserAvatar: _getCurrentAvatar(),
          secondUserAvatar: widget.avatarUrl ?? '',
          senderId: widget.userId,
          receiverId: widget.receiverIds.first,
          chatId: widget.conversationId,
          replyToMessageId: currentState.maybeWhen(
            loaded:
                (
                  messages,
                  isReplyMode,
                  replyToMessage,
                  isScrollingToMessage,
                  highlightedMessageId,
                ) => replyToMessage?.id,
            orElse: () => null,
          ),
          replyText: currentState.maybeWhen(
            loaded:
                (
                  messages,
                  isReplyMode,
                  replyToMessage,
                  isScrollingToMessage,
                  highlightedMessageId,
                ) => replyToMessage?.message,
            orElse: () => null,
          ),
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ),
      ),
    );

    _messageController.clear();
    context.read<ChatScreenBloc>().add(const ChatScreenEvent.clearReplyMode());
    _scrollToBottom();
    _hasScrolledToBottom = true; // Позначити що скролили до нового повідомлення
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void _deleteMessage(String messageId) {
    context.read<ChatScreenBloc>().add(
      ChatScreenEvent.deleteMessage(
        DeleteMessageParams(
          messageId: messageId,
          chatId: widget.conversationId,
          senderId: widget.userId,
        ),
      ),
    );
  }

  void _readMessage(MessageParams message) {
    context.read<ChatScreenBloc>().add(ChatScreenEvent.readMessage(message));
  }

  String _getCurrentUserName() {
    final settingsState = context.read<SettingsBloc>().state;
    return settingsState.maybeWhen(
      success: (user) => user.name.isNotEmpty ? user.name : 'Unknown User',
      orElse: () => 'Unknown User',
    );
  }
}
