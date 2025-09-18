import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_list_item.dart';
import 'package:telegram_copy/feature/chat_list/presentation/bloc/users/users_bloc.dart';

class SuggestUser extends StatefulWidget {
  final int index;

  const SuggestUser({super.key, required this.index});

  @override
  State<SuggestUser> createState() => _SuggestUserState();
}

class _SuggestUserState extends State<SuggestUser> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is UsersError) {
          return Center(child: Text(state.message));
        }
        if (state is UsersSuccess) {
          if (widget.index >= state.users.length) {
            return const SizedBox.shrink();
          }

          return UserListItem(
            onTap: () {
              final user = state.users[widget.index];
              context.push(
                '/chat_list/user/${user.uid}',
                extra: {'name': user.name},
              );
            },
            leading: Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27.5.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Icon(Icons.person, color: Colors.black, size: 24.r),
            ),
            title: Text(
              state.users[widget.index].name,
              style: AppTextStyle.getRegularBlack(),
            ),
            subtitle: Text(
              state.users[widget.index].bio,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.getFilterText(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
