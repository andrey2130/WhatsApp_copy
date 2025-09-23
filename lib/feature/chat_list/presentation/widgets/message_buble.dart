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
    Key? key,
    this.id,
    required this.message,
    required this.isMe,
    this.time,
    this.messageId,
    this.doubleTap,
    this.isRead = false,
    this.isReply = false,
    this.swipe,
    this.replyAuthor,
    this.repliedText,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onDoubleTap: doubleTap,
        child: SwipeTo(
          onRightSwipe: swipe,
          child: Column(
            children: [
              (isReply ?? false)
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 4.h,
                        bottom: 4.h,
                        left: isMe ? 50.w : 8.w,
                        right: isMe ? 8.w : 50.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: isMe
                            ? AppColors.messageBubleColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                          bottomLeft: isMe
                              ? Radius.circular(12.r)
                              : Radius.circular(8.r),
                          bottomRight: isMe
                              ? Radius.circular(8.r)
                              : Radius.circular(12.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        replyAuthor?.senderName ?? '',
                                        maxLines: 1,

                                        style:
                                            AppTextStyle.getMessageBubleText()
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(
                                                    0xFF128C7E,
                                                  ),
                                                ),
                                      ),
                                      SizedBox(height: 2.h),
                                      if ((repliedText ?? '').isNotEmpty)
                                        Text(
                                          repliedText!,
                                          style:
                                              AppTextStyle.getMessageBubleText()
                                                  .copyWith(
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
                          SizedBox(height: 8.h),
                          Text(
                            message,
                            style: AppTextStyle.getMessageBubleText(),
                          ),
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
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        top: 4.h,
                        bottom: 4.h,
                        left: isMe ? 50.w : 8.w,
                        right: isMe ? 8.w : 50.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: AppTextStyle.getMessageBubleText(),
                          ),
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
}
