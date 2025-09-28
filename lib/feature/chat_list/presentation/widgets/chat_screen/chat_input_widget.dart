import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/chat_screen/chat_screen_bloc.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/message_input.dart';

class ChatInputWidget extends StatelessWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final Function(String) onSendMessage;
  final VoidCallback onPickPhoto;

  const ChatInputWidget({
    required this.messageController,
    required this.focusNode,
    required this.onSendMessage,
    required this.onPickPhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatScreenBloc, ChatScreenState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded:
              (
                messages,
                isReplyMode,
                replyToMessage,
                isScrollingToMessage,
                highlightedMessageId,
              ) => MessageInput(
                messageController: messageController,
                focusNode: focusNode,
                isReply: isReplyMode,
                replyToMessage: replyToMessage,
                onClearReply: () {
                  context.read<ChatScreenBloc>().add(
                    const ChatScreenEvent.clearReplyMode(),
                  );
                },
                onChanged: (_) {},
                onSubmit: onSendMessage,
                onPressCamera: onPickPhoto,
              ),
          orElse: () => MessageInput(
            messageController: messageController,
            focusNode: focusNode,
            isReply: false,
            onClearReply: () {},
            onChanged: (_) {},
            onSubmit: onSendMessage,
            onPressCamera: onPickPhoto,
          ),
        );
      },
    );
  }
}
