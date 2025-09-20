import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/utils/widgets/custom_textfield.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/injections.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/conversations/conversations_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/messages/messages_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.userId,
    required this.userName,
    this.avatarUrl,
    required this.conversationId,
  });
  final String userId;
  final String userName;
  final String? avatarUrl;
  final String conversationId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MessagesBloc>(
              create: (context) => getIt<MessagesBloc>(),
            ),
            BlocProvider<ConversationsBloc>(
              create: (context) => getIt<ConversationsBloc>(),
            ),
          ],
          child: BlocConsumer<MessagesBloc, MessagesState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (messages) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  });
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              state.maybeWhen(
                initial: () {
                  context.read<MessagesBloc>().add(
                    MessagesEvent.subscribe(widget.conversationId),
                  );
                },
                orElse: () {},
              );
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
                      child: widget.avatarUrl == null
                          ? Icon(Icons.person)
                          : null,
                    ),
                    left2Widget: Text(widget.userName),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/whatsAppBack.jpg',
                              ),
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
      ),
    );
  }

  Widget _buildMessagesList(MessagesState state) {
    return state.maybeWhen(
      success: (messages) {
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
            return BlocBuilder<AuthBloc, AuthBlocState>(
              builder: (context, authState) {
                final currentUserId = authState.maybeWhen(
                  authenticated: (userId) => userId,
                  orElse: () => null,
                );

                return MessageBuble(
                  message: messages[index].content,
                  isMe: messages[index].senderId == currentUserId,
                  time: messages[index].sentAt,
                );
              },
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
            child: BlocBuilder<AuthBloc, AuthBlocState>(
              builder: (context, authState) {
                final currentUserId = authState.maybeWhen(
                  authenticated: (userId) => userId,
                  orElse: () => null,
                );

                return IconButton(
                  color: Colors.white,
                  onPressed: currentUserId != null
                      ? () {
                          context.read<MessagesBloc>().add(
                            MessagesEvent.send(
                              MessageParams(
                                content: messageController.text,
                                isRead: false,
                                sentAt: DateTime.now().toIso8601String(),
                                createdAt: DateTime.now().toIso8601String(),
                                updatedAt: DateTime.now().toIso8601String(),
                                conversationId: widget.conversationId,
                                senderId: currentUserId,
                              ),
                            ),
                          );
                          messageController.clear();
                        }
                      : null,
                  icon: Icon(Icons.send),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
