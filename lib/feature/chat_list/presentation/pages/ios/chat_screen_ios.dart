// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/utils/date_formatter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/delete_messaga.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chats/chats_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/chat_navigation_bar.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_input.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:telegram_copy/injections.dart';
import 'package:uuid/uuid.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

  bool _isReply = false;
  MessageParams? _replyToMessage;
  String? _highlightMessageId;
  bool _suppressAutoScroll = false;
  static const double _autoScrollThreshold = 120.0;

  bool _isNearBottom() {
    if (!_scrollController.hasClients) return true;
    final max = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;
    return (max - offset) <= _autoScrollThreshold;
  }

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsBloc, ChatsState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (chats) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });
          },
          messagesLoaded: (messages) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });
            _suppressAutoScroll = false;
          },
          chatWithMessages: (chats, messages) {
            if (!_suppressAutoScroll && _isNearBottom()) {
              _scrollToBottom();
            }
          },

          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          loading: () => const Center(
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
          success: () {},
          orElse: () {
            getIt<Talker>().handle('ChatScreen unexpected state: $state');
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
                        child: state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          error: (message) => Center(child: Text(message)),
                          loaded: (chats) => _buildMessagesListView([]),
                          messagesLoaded: _buildMessagesListView,
                          chatWithMessages: (chats, messages) =>
                              _buildMessagesListView(messages),
                          success: () => _buildMessagesListView([]),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MessageInput(
                          messageController: _messageController,
                          focusNode: _focusNode,
                          isReply: _isReply,
                          replyToMessage: _replyToMessage,
                          onClearReply: () {
                            setState(() {
                              _isReply = false;
                              _replyToMessage = null;
                            });
                          },
                          onChanged: (_) => setState(() {}),
                          onSubmit: (value) =>
                              _sendMessage(value, _messageController),
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
      _suppressAutoScroll = true;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5,
      ).then((_) {
        setState(() {
          _highlightMessageId = id;
        });
        Future.delayed(const Duration(milliseconds: 900), () {
          if (mounted && _highlightMessageId == id) {
            setState(() {
              _highlightMessageId = null;
              _suppressAutoScroll = false;
            });
          }
        });
      });
    }
  }

  Widget _buildMessagesListView(List<MessageParams> messages) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_suppressAutoScroll && messages.isNotEmpty && _isNearBottom()) {
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
        MessageParams? replyAuthor;
        if (message.replyToMessageId != null) {
          try {
            replyAuthor = messages.firstWhere(
              (m) => m.id == message.replyToMessageId,
            );
          } catch (_) {
            replyAuthor = null;
          }
        }
        final key = _messageKeys.putIfAbsent(message.id, GlobalKey.new);
        return VisibilityDetector(
          key: Key(message.id),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 1 &&
                message.isRead != true &&
                message.senderId != widget.userId) {
              _readMessage(message);
            }
          },

          child: AnimatedContainer(
            key: key,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              color: _highlightMessageId == message.id
                  ? Colors.green.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: MessageBuble(
              swipe: (details) => _replyMessage(message),
              onTapReply: message.replyToMessageId != null
                  ? () => _scrollToMessage(message.replyToMessageId!)
                  : null,
              id: message.id,
              messageId: message.id,
              message: message.message,
              isMe: isMe,
              time: DateFormatter.timeHm(message.createdAt),
              isRead: message.isRead,
              isReply: message.replyToMessageId != null,
              replyAuthor: replyAuthor,
              repliedText: message.replyText,
              doubleTap: () {
                _deleteMessage(message.id);
              },
            ),
          ),
        );
      },
    );
  }

  void _replyMessage(MessageParams message) {
    setState(() {
      _isReply = true;
      _replyToMessage = message;
      _focusNode.requestFocus();
    });
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

  void _sendMessage(String message, TextEditingController messageController) {
    if (message.trim().isEmpty) return;

    context.read<ChatsBloc>().add(
      ChatsEvent.sendMessage(
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
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ),
      ),
    );

    messageController.clear();
    setState(() {
      _isReply = false;
      _replyToMessage = null;
    });
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

  void _readMessage(MessageParams message) {
    context.read<ChatsBloc>().add(ChatsEvent.readMessage(message));
  }

  String _getCurrentUserName() {
    final settingsState = context.read<SettingsBloc>().state;
    return settingsState.maybeWhen(
      success: (user) => user.name.isNotEmpty ? user.name : 'Unknown User',
      orElse: () => 'Unknown User',
    );
  }
}
