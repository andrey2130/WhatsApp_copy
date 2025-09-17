import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_list_item.dart';

class SuggestUser extends StatelessWidget {
  const SuggestUser({super.key});

  @override
  Widget build(BuildContext context) {
    return UserListItem(
      onTap: () {},
      leading: Container(
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.5.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Icon(Icons.person, color: Colors.black, size: 24.r),
      ),
      title: Text('John Doe', style: AppTextStyle.getRegularBlack()),
      subtitle: Text(
        'About User',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.getFilterText(),
      ),
    );
  }
}
