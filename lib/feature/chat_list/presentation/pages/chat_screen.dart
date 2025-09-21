import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:telegram_copy/injections.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatScreen extends StatefulWidget {
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
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatsBloc>().add(
      ChatsEvent.loadChatMessages(widget.conversationId),
    );
    context.read<ChatsBloc>().add(
      ChatsEvent.watchMessage(widget.conversationId),
    );
    context.read<SettingsBloc>().add(const SettingsEvent.loadRequested());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsBloc, ChatsState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (chats) {
            _scrollToBottom();
          },
          messagesLoaded: (messages) {
            _scrollToBottom();
          },
          chatWithMessages: (chats, messages) {
            _scrollToBottom();
          },
          loading: () {
            Center(child: CircularProgressIndicator.adaptive());
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          success: () {
            print('Message deleted successfully');
            // Don't do anything special, just let the UI rebuild
          },
          orElse: () {
            getIt<Talker>().handle(
              'ChatScreen unexpected state: ${state.toString()}',
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  leftWidget: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  avatarWidget: CircleAvatar(
                    backgroundImage: widget.avatarUrl != null
                        ? NetworkImage(widget.avatarUrl!)
                        : null,
                    child: widget.avatarUrl == null ? Icon(Icons.person) : null,
                  ),
                  left2Widget: Text(widget.userName),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/whatsAppBack.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          error: (message) => Center(child: Text(message)),
                          loaded: (chats) => _buildMessagesList(),
                          messagesLoaded: (messages) => _buildMessagesList(),
                          chatWithMessages: (chats, messages) =>
                              _buildMessagesList(),
                          success: () => _buildMessagesList(),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _buildMessageInput(_messageController),
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

  Widget _buildMessagesList() {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return state.maybeWhen(
          messagesLoaded: (messages) => _buildMessagesListView(messages),
          chatWithMessages: (chats, messages) =>
              _buildMessagesListView(messages),
          success: () => _buildMessagesListView([]),
          loading: () => const SizedBox.shrink(),
          error: (message) => const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildMessagesListView(List<MessageParams> messages) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 16.h, bottom: 80.h, left: 8.w, right: 8.w),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message.senderId == widget.userId;

        return VisibilityDetector(
          key: Key(message.id),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 1) {
              _readMessage(message);
            }
          },
          child: MessageBuble(
            id: message.id,
            messageId: message.id,
            message: message.message,
            isMe: isMe,
            time: _dateFormat(message.createdAt),
            doubleTap: () {
              _deleteMessage(message.id);
            },
          ),
        );
      },
    );
  }

  Widget _buildMessageInput(TextEditingController messageController) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: messageController,
              hintText: 'Message',
              prefixIcon: Icon(Icons.emoji_emotions_outlined),
              sufixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.attach_file),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: BlocBuilder<AuthBloc, AuthBlocState>(
              builder: (context, authState) {
                authState.maybeWhen(
                  authenticated: (userId) => userId,
                  orElse: () => null,
                );

                return IconButton(
                  color: Colors.white,
                  onPressed: () =>
                      _sendMessage(messageController.text, messageController),
                  icon: Icon(Icons.send),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message, TextEditingController messageController) {
    if (message.trim().isEmpty) return;

    context.read<ChatsBloc>().add(
      ChatsEvent.sendMessage(
        MessageParams(
          id: const Uuid().v4(),
          senderName: _getCurrentUserName(), // Current user's name
          receiverName: widget.userName, // Receiver's name
          message: message.trim(),
          senderId: widget.userId,
          receiverId: widget.receiverIds.first, // This is the receiver's ID
          chatId: widget.conversationId,
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ),
      ),
    );

    messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String _dateFormat(String date) {
    return DateFormat('HH:mm').format(DateTime.parse(date));
  }

  void _deleteMessage(String messageId) {
    print('_deleteMessage called with messageId: $messageId');
    context.read<ChatsBloc>().add(
      ChatsEvent.deleteMessage(
        DeleteMessageParams(
          messageId: messageId,
          chatId: widget.conversationId,
          senderId: widget.userId,
        ),
      ),
    );
  }

  String _getCurrentUserName() {
    final settingsState = context.read<SettingsBloc>().state;
    return settingsState.maybeWhen(
      success: (user) => user.name.isNotEmpty ? user.name : 'Unknown User',
      orElse: () => 'Unknown User',
    );
  }

  void _readMessage(MessageParams message) {
    print('_readMessage called with message: ${message.id}');
    context.read<ChatsBloc>().add(ChatsEvent.readMessage(message));
  }
}
