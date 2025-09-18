import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_list_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/conversation_params.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.userId,
    required this.userName,
    this.avatarUrl,
  });
  final String userId;
  final String userName;
  final String? avatarUrl;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _messageController = TextEditingController();
  String? _conversationId;

  @override
  void initState() {
    super.initState();
    context.read<ChatListBloc>().add(
      const ChatListEvent.subscribeConversations(),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ChatListBloc, ChatListState>(
          listener: (context, state) {
            state.maybeWhen(
              messagesSuccess: (conversationId, conversations, messages) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              conversationsSuccess: (conversations) {
                final currentUserId = FirebaseAuth.instance.currentUser?.uid;
                if (currentUserId == null) return;
                final id = _findConversationId(
                  conversations,
                  currentUserId,
                  widget.userId,
                );
                if (id != null && id != _conversationId) {
                  _conversationId = id;
                  context.read<ChatListBloc>().add(
                    ChatListEvent.subscribeMessages(conversationId: id),
                  );
                }
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Column(
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
                        child: _buildMessagesList(state),
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessagesList(ChatListState state) {
    return state.maybeWhen(
      messagesSuccess: (conversationId, conversations, messages) {
        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 80.h,
            left: 8.w,
            right: 8.w,
          ),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];
            final currentUserId = FirebaseAuth.instance.currentUser?.uid;
            return MessageBuble(
              message: msg.content,
              isMe: msg.senderId == currentUserId,
              time: msg.sentAt,
            );
          },
        );
      },
      orElse: () {
        return ListView(
          controller: _scrollController,
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 80.h,
            left: 8.w,
            right: 8.w,
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
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                if (messageController.text.isEmpty) return;
                final currentUserId = FirebaseAuth.instance.currentUser?.uid;
                if (currentUserId == null) return;
                final text = messageController.text.trim();
                String? id = _conversationId;
                final bloc = context.read<ChatListBloc>();
                final state = bloc.state;
                state.maybeWhen(
                  conversationsSuccess: (conversations) {
                    id ??= _findConversationId(
                      conversations,
                      currentUserId,
                      widget.userId,
                    );
                  },
                  orElse: () {},
                );
                if (id == null) {
                  final newConversationId = DateTime.now()
                      .microsecondsSinceEpoch
                      .toString();
                  final conversation = ConversationParams(
                    id: newConversationId,
                    title: widget.userName,
                    isGroup: false,
                    participantIds: [currentUserId, widget.userId],
                    creatorId: currentUserId,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  bloc.add(
                    ChatListEvent.sendConversation(conversation: conversation),
                  );
                  _conversationId = newConversationId;
                  id = newConversationId;
                  bloc.add(
                    ChatListEvent.subscribeMessages(conversationId: id!),
                  );
                }
                final msg = MessageParams(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  content: text,
                  isRead: false,
                  sentAt: DateTime.now().toIso8601String(),
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String(),
                  conversationId: id!,
                  senderId: currentUserId,
                );
                bloc.add(ChatListEvent.sendMessage(message: msg));
                messageController.clear();
              },
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }

  String? _findConversationId(
    List<ConversationParams> conversations,
    String currentUserId,
    String otherUserId,
  ) {
    for (final c in conversations) {
      if (!c.isGroup &&
          c.participantIds.contains(currentUserId) &&
          c.participantIds.contains(otherUserId)) {
        return c.id;
      }
    }
    return null;
  }
}
