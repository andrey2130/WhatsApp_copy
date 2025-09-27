import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

class FilterWidgets extends StatelessWidget {
  final String selectedFilter;
  final int unReadCount;
  final void Function(String) onFilterSelected;

  const FilterWidgets({
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.unReadCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'name': 'All', 'count': null},
      {'name': 'Unread', 'count': unReadCount},
      {'name': 'Favorites', 'count': null},
      {'name': 'Groups', 'count': null},
    ];

    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter['name'];
          final count = filter['count'] as int?;
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: GestureDetector(
              onTap: () => onFilterSelected(filter['name']! as String),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: isSelected ? const Color(0xFFCCFFCC) : Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filter['name']! as String,
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
