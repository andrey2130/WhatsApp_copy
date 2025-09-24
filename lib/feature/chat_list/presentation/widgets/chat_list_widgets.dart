import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_avatar_widget.dart';
import 'package:telegram_copy/core/utils/widgets/user_list_item.dart';
import 'package:telegram_copy/feature/auth/pages/bloc/bloc/auth_bloc.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/chat_params/chat.dart';

class ChatListWidgets extends StatelessWidget {
  final int index;
  final ChatParams chat;

  const ChatListWidgets({super.key, required this.index, required this.chat});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, authState) {
        final currentUserId = authState.maybeWhen(
          authenticated: (userId) => userId,
          orElse: () => '',
        );

        return _buildChatItem(context, currentUserId);
      },
    );
  }

  Widget _buildChatItem(BuildContext context, String currentUserId) {
    return Column(
      children: [
        UserListItem(
          onTap: () {
            // Navigate to chat screen
            context.push(
              '/chat_list/user/${chat.id}',
              extra: {
                'name': getDisplayName(currentUserId),
                'conversationId': chat.id,
                'photoUrl': '',
                'receiverIds': [getReceiverId(currentUserId)],
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
              child: UserAvatarWidget(
                height: 50,
                width: 50,
                photoUrl: getReceiverPhotoUrl(currentUserId, chat),
              ),
            ),
          ),
          title: Text(
            getDisplayName(currentUserId),
            style: AppTextStyle.getRegularBlack().copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            '${chat.lastMessage}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.getFilterText(),
          ),
          meta: Text(
            _formatTime(chat.updatedAt),
            style: AppTextStyle.getFilterText().copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF959595),
            ),
          ),
          badge:
              chat.unreadCount[currentUserId] != null &&
                  chat.unreadCount[currentUserId]! > 0
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    chat.unreadCount[currentUserId]!.toString(),
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                )
              : null,
        ),
        Padding(
          padding: EdgeInsets.only(left: 62.w),
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: AppColors.borderColor,
          ),
        ),
      ],
    );
  }

  String getReceiverPhotoUrl(String currentUserId, ChatParams chat) {
    if (currentUserId == chat.firstUserId) {
      return chat.secondUserAvatar ?? '';
    } else {
      return chat.firstUserAvatar ?? '';
    }
  }

  String getDisplayName(String currentUserId) {
    if (currentUserId == chat.firstUserId) {
      return chat.secondUserName;
    } else {
      return chat.fistUserName;
    }
  }

  String getReceiverId(String currentUserId) {
    if (currentUserId == chat.firstUserId) {
      return chat.secondUserId;
    } else {
      return chat.firstUserId;
    }
  }

  String _formatTime(String dateTime) {
    try {
      final now = DateTime.now();
      final parsedDate = DateTime.parse(dateTime);
      final difference = now.difference(parsedDate);

      if (difference.inDays > 0) {
        return '${difference.inDays}d';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m';
      } else {
        return 'now';
      }
    } catch (e) {
      return 'now';
    }
  }
}
