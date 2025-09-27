import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipe_to/swipe_to.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';

class MessageBuble extends StatelessWidget {
  const MessageBuble({
    required this.message,
    required this.isMe,
    super.key,
    this.id,
    this.onTapReply,
    this.time,
    this.messageId,
    this.doubleTap,
    this.isRead = false,
    this.isReply = false,
    this.swipe,
    this.replyAuthor,
    this.repliedText,
    this.imageUrl,
  });

  final String? id;
  final String message;
  final bool isMe;
  final String? time;
  final String? messageId;
  final VoidCallback? doubleTap;
  final bool isRead;
  final bool? isReply;
  final GestureDragUpdateCallback? swipe;
  final MessageParams? replyAuthor;
  final String? repliedText;
  final VoidCallback? onTapReply;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onDoubleTap: doubleTap,
        child: SwipeTo(
          onLeftSwipe: (details) {
            if (isMe) {
              swipe?.call(details);
            }
          },
          onRightSwipe: (details) {
            if (!isMe) {
              swipe?.call(details);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Reply Block ---
              if (isReply ?? false)
                GestureDetector(
                  onTap: onTapReply,
                  child: _buildReplyContainer(),
                ),

              // --- Main Message Container ---
              AnimatedContainer(
                margin: EdgeInsets.only(
                  top: 4.h,
                  bottom: 4.h,
                  left: isMe ? 50.w : 8.w,
                  right: isMe ? 8.w : 50.w,
                ),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppColors.messageBubleColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                    bottomLeft: isMe
                        ? Radius.circular(8.r)
                        : Radius.circular(2.r),
                    bottomRight: isMe
                        ? Radius.circular(2.r)
                        : Radius.circular(8.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imageUrl != null)
                      Container(
                        margin: EdgeInsets.only(bottom: 8.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return SizedBox(
                                height: 150.h,
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                SizedBox(
                                  height: 150.h,
                                  child: const Center(child: Icon(Icons.error)),
                                ),
                          ),
                        ),
                      ),

                    if (message.isNotEmpty)
                      Text(message, style: AppTextStyle.getMessageBubleText()),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (time != null) ...[
                          SizedBox(height: 2.h),
                          Text(
                            time!,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (isMe) ...[
                            SvgPicture.asset(
                              'assets/icons/check_mark.svg',
                              colorFilter: ColorFilter.mode(
                                isRead
                                    ? AppColors.primaryBlue
                                    : AppColors.iconGrey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReplyContainer() {
    return AnimatedContainer(
      margin: EdgeInsets.only(
        top: 4.h,
        bottom: 4.h,
        left: isMe ? 50.w : 8.w,
        right: isMe ? 8.w : 50.w,
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 6.h),
      decoration: BoxDecoration(
        color: isMe ? AppColors.messageBubleColor : AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: isMe ? Radius.circular(12.r) : Radius.circular(8.r),
          bottomRight: isMe ? Radius.circular(8.r) : Radius.circular(12.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 4.w,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.replyBorderColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        replyAuthor?.senderName ?? '',
                        maxLines: 1,
                        style: AppTextStyle.getMessageBubleText().copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF128C7E),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      if ((repliedText ?? '').isNotEmpty)
                        Text(
                          repliedText!,
                          style: AppTextStyle.getMessageBubleText().copyWith(
                            color: Colors.black87,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
