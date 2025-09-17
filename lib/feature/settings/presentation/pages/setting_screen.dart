import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/utils/widgets/user_list_item.dart';

import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(const SettingsEvent.loadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is Failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            return Column(
              children: [
                CustomAppBar(
                  leftWidget: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  left2Widget: Text(
                    'Setting',
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 20,
                    ),
                  ),
                  right3Widget: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: UserListItem(
                    onTap: () => context.push('/settings/user'),
                    leading: Container(
                      width: 50.r,
                      height: 50.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.5.r),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 24.r,
                      ),
                    ),
                    title: Text(
                      context.read<SettingsBloc>().state.maybeWhen(
                        orElse: () => '',
                        success: (user) => user.email ?? '',
                      ),
                      style: AppTextStyle.getRegularBlack(),
                    ),
                    subtitle: Text(
                      context.read<SettingsBloc>().state.maybeWhen(
                        orElse: () => '',
                        success: (user) => user.bio,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.getFilterText(),
                    ),
                    trailing: const [Icon(Icons.chevron_right)],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
