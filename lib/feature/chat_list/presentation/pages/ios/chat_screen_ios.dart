import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:uuid/uuid.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:telegram_copy/injections.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({
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
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
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
          success: () {},
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
                _buildNavigationBar(),
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

  Widget _buildNavigationBar() {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      border: null,
      padding: const EdgeInsetsDirectional.only(start: 0, end: 8),
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.pop(),
        child: const Icon(CupertinoIcons.back, size: 26),
      ),
      middle: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundImage: widget.avatarUrl != null
                  ? NetworkImage(widget.avatarUrl!)
                  : null,
              child: widget.avatarUrl == null
                  ? const Icon(Icons.person, size: 18)
                  : null,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    maxLines: 1,
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'tap here for contact info',
                    maxLines: 1,

                    style: AppTextStyle.getGreySettingsText(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/video_camera.svg'),
          SizedBox(width: 16.w),
          SvgPicture.asset('assets/icons/phone_icon.svg'),
        ],
      ),
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messages.isNotEmpty) {
        _scrollToBottom();
      }
    });

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

  Widget _buildMessageInput(TextEditingController messageController) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.add,
              size: 32,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: CupertinoTextField(
              controller: messageController,
              placeholder: 'Message',
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(color: Colors.black12),
              ),
              cursorColor: Colors.black,
              onChanged: (_) => setState(() {}),
              onSubmitted: (value) => _sendMessage(value, messageController),
              suffix: Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: SvgPicture.asset('assets/icons/sufix_icon.svg'),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          messageController.text.isEmpty
              ? Row(
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.mic_solid,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ],
                )
              : CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      _sendMessage(messageController.text, messageController),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.buttonGreen,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/send_icon.svg'),
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
          senderName: _getCurrentUserName(),
          receiverName: widget.userName,
          message: message.trim(),
          senderId: widget.userId,
          receiverId: widget.receiverIds.first,
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
    context.read<ChatsBloc>().add(ChatsEvent.readMessage(message));
  }
}
