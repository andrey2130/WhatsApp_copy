import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_list_item.dart';

class ChatListWidgets extends StatelessWidget {
  final int index;

  const ChatListWidgets({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return UserListItem(
      onTap: () {
        // Navigate to chat screen
        context.push(
          '/chat_list/user/1',
          extra: {
            'name': '1',
            'conversationId': '1',
            'photoUrl': '1',
            'receiverIds': ['1'].where((id) => id != '1').toList(),
          },
        );
      },
      leading: Container(
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.5.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(27.5.r),
          child: Image.network(
            '1',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.person, color: Colors.black, size: 24.r);
            },
          ),
        ),
      ),
      title: Text('1', style: AppTextStyle.getRegularBlack()),
      subtitle: Text(
        '1',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.getFilterText(),
      ),
      meta: Text(
        _formatTime('1'),
        style: AppTextStyle.getFilterText().copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF959595),
        ),
      ),
      badge: 1 > 0
          ? Container(
              width: 18.w,
              height: 16.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '1',
                textAlign: TextAlign.center,
                style: AppTextStyle.getFilterText(),
              ),
            )
          : null,
    );
  }

  String _formatTime(String dateTime) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(dateTime));

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
