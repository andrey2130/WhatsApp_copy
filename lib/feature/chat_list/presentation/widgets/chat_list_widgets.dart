import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

class ChatListWidgets extends StatelessWidget {
  const ChatListWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27.5.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Icon(Icons.person, color: Colors.black, size: 24.r),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('John Doe', style: AppTextStyle.getRegularBlack()),
                      Text(
                        '12:00',
                        style: AppTextStyle.getFilterText().copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF959595),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Typing...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.getFilterText(),
                        ),
                      ),
                      if (true)
                        Container(
                          width: 18.w,
                          height: 16.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            // ignore: unrelated_type_equality_checks
                            '1',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.getFilterText(),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
