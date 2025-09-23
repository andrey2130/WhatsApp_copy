import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';

class ReplyMessageWidget extends StatefulWidget {
  final MessageParams message;
  final VoidCallback onTap;
  const ReplyMessageWidget({
    super.key,
    required this.message,
    required this.onTap,
  });

  @override
  State<ReplyMessageWidget> createState() => _ReplyMessageWidgetState();
}

class _ReplyMessageWidgetState extends State<ReplyMessageWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double maxTextWidth = screenWidth * 0.75;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.zero),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 6.r,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.replyBorderColor,
                borderRadius: BorderRadius.zero,
              ),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxTextWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.message.senderName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.getRegularBlack().copyWith(
                        color: const Color(0xFF128C7E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      widget.message.message,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: screenWidth < 340 ? 2 : 4,
                      style: AppTextStyle.getGreySettingsText().copyWith(
                        color: const Color(0xFF303030),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: widget.onTap,
              child: const Icon(
                CupertinoIcons.clear,
                size: 24,
                color: Color(0xFF128C7E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
