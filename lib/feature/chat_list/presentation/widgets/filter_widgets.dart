import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

class FilterWidgets extends StatelessWidget {
  const FilterWidgets({super.key, required this.selectedFilter});
  final String selectedFilter;

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'name': 'All', 'count': null},
      {'name': 'Unread', 'count': 1},
      {'name': 'Favorites', 'count': null},
      {'name': 'Groups', 'count': null},
    ];

    return SizedBox(
      height: 32.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length + 1,
        itemBuilder: (context, index) {
          if (index == filters.length) {
            return Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, size: 20.sp),
                  padding: EdgeInsets.zero,
                ),
              ),
            );
          }

          final filter = filters[index];
          final isSelected = selectedFilter == filter['name'];
          final count = filter['count'] as int?;

          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: isSelected ? Color(0xFFCCFFCC) : Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filter['name'] as String,
                      style: AppTextStyle.getFilterText(),
                    ),
                    if (count != null) ...[
                      SizedBox(width: 4.w),
                      Text(
                        count.toString(),
                        style: AppTextStyle.getFilterText(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
