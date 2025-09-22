import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

class MessageBuble extends StatelessWidget {
  const MessageBuble({
    super.key,
    required this.message,
    required this.isMe,
    this.time,
    this.messageId,
    this.doubleTap,
    this.id,
    this.isRead = false,
  });
  final String? id;
  final String message;
  final bool isMe;
  final String? time;
  final String? messageId;
  final VoidCallback? doubleTap;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onDoubleTap: doubleTap,
        child: Container(
          margin: EdgeInsets.only(
            top: 4.h,
            bottom: 4.h,
            left: isMe ? 50.w : 8.w,
            right: isMe ? 8.w : 50.w,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isMe ? AppColors.messageBubleColor : AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomLeft: isMe ? Radius.circular(8.r) : Radius.circular(2.r),
              bottomRight: isMe ? Radius.circular(2.r) : Radius.circular(8.r),
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
