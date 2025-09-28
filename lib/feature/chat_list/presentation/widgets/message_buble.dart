// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        GestureDetector(
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
                if (isReply ?? false)
                  GestureDetector(
                    onTap: onTapReply,
                    child: _buildReplyContainer(),
                  )
                else
                  Container(
                    margin: EdgeInsets.only(
                      top: 4.h,
                      bottom: 4.h,
                      left: isMe ? 8.w : 8.w,
                      right: isMe ? 8.w : 8.w,
                    ),
                    child: IntrinsicWidth(
                      child: AnimatedContainer(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (imageUrl != null)
                              Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                height: 200.h,
                                width: 250.w, // Fixed width for images
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(
                                    imageUrl!,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            height: 200.h,
                                            width: 250.w,
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator.adaptive(),
                                            ),
                                          );
                                        },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              height: 200.h,
                                              width: 250.w,
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child: Icon(Icons.error),
                                              ),
                                            ),
                                  ),
                                ),
                              ),

                            if (message.isNotEmpty && !(isReply ?? false))
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            200.w, // Maximum width for text
                                      ),
                                      child: Text(
                                        message,
                                        style:
                                            AppTextStyle.getMessageBubleText(),
                                      ),
                                    ),
                                  ),
                                  if (time != null) ...[
                                    SizedBox(width: 4.w),
                                    Text(
                                      time!,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    if (isMe) ...[
                                      SizedBox(width: 2.w),
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
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReplyContainer() {
    return Container(
      margin: EdgeInsets.only(
        top: 2.h,
        bottom: 2.h,
        left: isMe ? 8.w : 8.w,
        right: isMe ? 8.w : 8.w,
      ),
      child: IntrinsicWidth(
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: (isMe ? AppColors.messageBubleColor : AppColors.whiteColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: isMe ? Radius.circular(12.r) : Radius.circular(8.r),
              bottomRight: isMe ? Radius.circular(8.r) : Radius.circular(12.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 3.w,
                    height: 35.h,
                    margin: EdgeInsets.only(right: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.replyBorderColor,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(width: 4.w),
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            replyAuthor?.senderName ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          if (replyAuthor?.imageUrl != null)
                                            Text(
                                              'Photo',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey[600],
                                              ),
                                            )
                                          else if ((repliedText ?? '')
                                              .isNotEmpty)
                                            Text(
                                              repliedText!,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey[600],
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (replyAuthor?.imageUrl != null)
                                      Container(
                                        margin: EdgeInsets.only(left: 4.w),
                                        width: 35.w,
                                        height: 35.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                          child: Image.network(
                                            replyAuthor!.imageUrl!,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (
                                                  context,
                                                  child,
                                                  loadingProgress,
                                                ) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Container(
                                                    width: 35.w,
                                                    height: 35.h,
                                                    color: Colors.grey[200],
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator.adaptive(
                                                            strokeWidth: 2,
                                                          ),
                                                    ),
                                                  );
                                                },
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                                      width: 35.w,
                                                      height: 35.h,
                                                      color: Colors.grey[200],
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.error,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 200.w, // Maximum width for text
                      ),
                      child: Text(
                        message,
                        style: AppTextStyle.getMessageBubleText(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  if (time != null) ...[
                    SizedBox(width: 4.w),
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (isMe) ...[
                      SizedBox(width: 2.w),
                      SvgPicture.asset(
                        'assets/icons/check_mark.svg',
                        colorFilter: ColorFilter.mode(
                          isRead ? AppColors.primaryBlue : AppColors.iconGrey,
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
      ),
    );
  }
}
