import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/utils/date_formatter.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_buble.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatMessagesList extends StatelessWidget {
  final List<MessageParams> messages;
  final String currentUserId;
  final ScrollController scrollController;
  final Map<String, GlobalKey> messageKeys;
  final String? highlightedMessageId;
  final Function(MessageParams) onReplyMessage;
  final Function(String) onDeleteMessage;
  final Function(MessageParams) onReadMessage;
  final Function(String) onScrollToMessage;
  final bool hasScrolledToBottom;
  final Function() onFirstScroll;

  const ChatMessagesList({
    required this.messages,
    required this.currentUserId,
    required this.scrollController,
    required this.messageKeys,
    required this.onReplyMessage,
    required this.onDeleteMessage,
    required this.onReadMessage,
    required this.onScrollToMessage,
    required this.hasScrolledToBottom,
    required this.onFirstScroll,
    this.highlightedMessageId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messages.isNotEmpty && !hasScrolledToBottom) {
        _scrollToBottom();
        onFirstScroll();
      }
    });

    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(top: 16.h, bottom: 80.h, left: 4.w, right: 4.w),
      itemCount: messages.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message.senderId == currentUserId;
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

        final key = messageKeys.putIfAbsent(message.id, GlobalKey.new);

        return VisibilityDetector(
          key: Key('visibility-${message.id}'),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 1 &&
                message.isRead != true &&
                message.senderId != currentUserId) {
              onReadMessage(message);
            }
          },
          child: AnimatedContainer(
            key: key,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              color: highlightedMessageId == message.id
                  ? Colors.green.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: MessageBuble(
              swipe: (details) => onReplyMessage(message),
              onTapReply: message.replyToMessageId != null
                  ? () => onScrollToMessage(message.replyToMessageId!)
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
              doubleTap: () => onDeleteMessage(message.id),
              imageUrl: message.imageUrl,
            ),
          ),
        );
      },
    );
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }
}
