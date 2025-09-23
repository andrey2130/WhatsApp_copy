import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/presentation/widgets/reply_message.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({
    super.key,
    required this.messageController,
    required this.focusNode,
    required this.isReply,
    this.replyToMessage,
    required this.onClearReply,
    required this.onChanged,
    required this.onSubmit,
  });

  final TextEditingController messageController;
  final FocusNode focusNode;
  final bool isReply;
  final MessageParams? replyToMessage;
  final VoidCallback onClearReply;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isReply && replyToMessage != null)
            ReplyMessageWidget(message: replyToMessage!, onTap: onClearReply),
          if (isReply) SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  maxLines: null,
                  focusNode: focusNode,
                  controller: messageController,
                  placeholder: 'Message',
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.fromBorderSide(
                      const BorderSide(color: Colors.black12),
                    ),
                  ),
                  cursorColor: Colors.black,
                  onChanged: onChanged,
                  onSubmitted: onSubmit,
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
                      onPressed: () => onSubmit(messageController.text),
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonGreen,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/icons/send_icon.svg'),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
