import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/custom_bar.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBar(
                  leftWidget: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  left2Widget: Text(
                    'Profile',
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                _buildAvatar(),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: AppTextStyle.getButtonText().copyWith(
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildProfileSections(state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileSections(SettingsState state) {
    return state.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      success: (user) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            _buildProfileSection(
              icon: Icons.person_outline,
              title: 'Name',
              value: user.name.isNotEmpty ? user.name : 'No name set',
              onTap: () {},
            ),
            _buildProfileSection(
              icon: Icons.info_outline,
              title: 'About',
              value: user.bio.isNotEmpty
                  ? user.bio
                  : 'Hey there! I am using Telegram.',
              onTap: () {},
            ),
            _buildProfileSection(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: user.phoneNumber?.isNotEmpty == true
                  ? user.phoneNumber!
                  : 'No phone number',
              onTap: () {},
            ),
            _buildProfileSection(
              icon: Icons.link,
              title: 'Links',
              value: 'Add links',
              valueColor: AppColors.primaryGreen,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 24.r, color: Colors.grey[600]),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    value,
                    style: AppTextStyle.getFilterText().copyWith(
                      color: valueColor ?? Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

Widget _buildAvatar() {
  return CircleAvatar(
    radius: 80.r,
    backgroundColor: Colors.grey[300],
    child: Icon(Icons.person, size: 80.r, color: Colors.white),
  );
}
