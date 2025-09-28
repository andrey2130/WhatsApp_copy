import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_screen/chat_screen_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({
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
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
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
                _buildAppBar(),
                Expanded(
                  child: Stack(
                    children: [
                      _buildBackground(),
                      _buildMessagesContent(state),
                      _buildMessageInput(),
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

  Widget _buildAppBar() {
    return CustomAppBar(
      leftWidget: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      avatarWidget: CircleAvatar(
        backgroundImage: widget.avatarUrl != null
            ? NetworkImage(widget.avatarUrl!)
            : null,
        child: widget.avatarUrl == null ? const Icon(Icons.person) : null,
      ),
      left2Widget: Text(widget.userName),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/facebook_icon.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMessagesContent(ChatScreenState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      loaded:
          (
            messages,
            isReplyMode,
            replyToMessage,
            isScrollingToMessage,
            highlightedMessageId,
          ) => _buildMessagesList(messages),
      error: (message) => Center(child: Text(message)),
    );
  }

  Widget _buildMessagesList(List<MessageParams> messages) {
    return _buildMessagesListView(messages);
  }

  Widget _buildMessagesListView(List<MessageParams> messages) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messages.isNotEmpty && !_hasScrolledToBottom) {
        _scrollToBottom();
        _hasScrolledToBottom = true;
      }
    });

    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 16.h, bottom: 80.h, left: 8.w, right: 8.w),
      itemCount: messages.length,
      shrinkWrap: false,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message.senderId == widget.userId;

        return VisibilityDetector(
          key: Key(message.id),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 1 &&
                message.isRead != true &&
                message.senderId != widget.userId) {
              _readMessage(message);
            }
          },
          child: MessageBuble(
            id: message.id,
            messageId: message.id,
            message: message.message,
            isMe: isMe,
            time: _dateFormat(message.createdAt),
            isRead: message.isRead,
            doubleTap: () {
              _deleteMessage(message.id);
            },
          ),
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _messageController,
                hintText: 'Message',
                prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                sufixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_file),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            DecoratedBox(
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
                    onPressed: () => _sendMessage(
                      _messageController.text,
                      _messageController,
                    ),
                    icon: const Icon(Icons.send),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message, TextEditingController messageController) {
    if (message.trim().isEmpty) return;

    context.read<ChatScreenBloc>().add(
      ChatScreenEvent.sendMessage(
        MessageParams(
          id: const Uuid().v4(),
          senderName: _getCurrentUserName(),
          receiverName: widget.userName,
          message: message.trim(),
          senderId: widget.userId,
          receiverId: widget.receiverIds.first,
          chatId: widget.conversationId,
          firstUserAvatar: _getCurrentAvatar(),
          secondUserAvatar: widget.avatarUrl ?? '',
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ),
      ),
    );

    messageController.clear();
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

  String _dateFormat(String date) {
    return DateFormat('HH:mm').format(DateTime.parse(date));
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

  String _getCurrentAvatar() {
    return context.read<SettingsBloc>().state.maybeWhen(
      success: (user) => user.photoUrl,
      orElse: () => '',
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
    context.read<ChatScreenBloc>().add(ChatScreenEvent.readMessage(message));
  }
}
