import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_avatar_widget.dart';
import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class SettingScreenIos extends StatefulWidget {
  const SettingScreenIos({super.key});

  @override
  State<SettingScreenIos> createState() => _SettingScreenIosState();
}

class _SettingScreenIosState extends State<SettingScreenIos> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(const SettingsEvent.loadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: _buildMainContent,
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, SettingsState state) {
    if (state is Loading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (state is Failure) {
      _showErrorSnackBar(context, state.error.toString());
    }

    return _buildSettingsContent(context, state);
  }

  void _showErrorSnackBar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  Widget _buildSettingsContent(BuildContext context, SettingsState state) {
    return CustomScrollView(
      slivers: [
        _buildNavigationBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        _buildSearchField(),
        _buildProfileSection(context, state),
        _buildMainSettingsSection(),
        _buildSupportSection(),
        _buildMetaAppsSection(),
      ],
    );
  }

  Widget _buildNavigationBar() {
    return CupertinoSliverNavigationBar(
      backgroundColor: Colors.grey[200],
      heroTag: 'settings_navbar',
      largeTitle: Text(
        'Settings',
        style: AppTextStyle.getBoldGreen().copyWith(color: Colors.black),
      ),
    );
  }

  Widget _buildSearchField() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CupertinoSearchTextField(),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, SettingsState state) {
    return SliverToBoxAdapter(
      child: CupertinoListSection.insetGrouped(
        backgroundColor: Colors.grey.shade200,
        children: [_buildProfileTile(context, state), _buildAvatarTile()],
      ),
    );
  }

  Widget _buildMainSettingsSection() {
    return SliverToBoxAdapter(
      child: CupertinoListSection.insetGrouped(
        backgroundColor: Colors.grey.shade200,
        children: [
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.person_circle),
            title: 'Account',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.lock),
            title: 'Privacy',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.chat_bubble),
            title: 'Chats',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.bell),
            title: 'Notifications',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
            title: 'Storage and data',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return SliverToBoxAdapter(
      child: CupertinoListSection.insetGrouped(
        backgroundColor: Colors.grey.shade200,
        children: [
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.info_circle),
            title: 'Help',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.heart),
            title: 'Invite a friend',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMetaAppsSection() {
    return SliverToBoxAdapter(
      child: CupertinoListSection.insetGrouped(
        backgroundColor: Colors.grey.shade200,
        header: Text(
          'Also from Meta',
          style: AppTextStyle.getGreySettingsText(),
        ),
        children: [
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.camera),
            title: 'Open Instagram',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: SvgPicture.asset(
              'assets/icons/facebook_icon.svg',
              width: 24,
              height: 24,
            ),
            title: 'Open Facebook',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: const Icon(CupertinoIcons.at),
            title: 'Open Threads',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context, SettingsState state) {
    return GestureDetector(
      onTap: () => context.push('/settings/user'),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            _buildUserAvatar(state),
            const SizedBox(width: 16),
            Expanded(child: _buildUserInfo(state)),
            _buildQRCodeIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserAvatar(SettingsState state) {
    return Hero(
      tag: 'user_avatar',
      child: UserAvatarWidget(state: state, height: 56, width: 56),
    );
  }

  Widget _buildUserInfo(SettingsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.maybeWhen(
            orElse: () => 'User',
            success: (user) => user.name.isNotEmpty ? user.name : 'User',
          ),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          state.maybeWhen(
            orElse: () => 'Hey there! I am using Telegram.',
            success: (user) => user.bio.isNotEmpty
                ? user.bio
                : 'Hey there! I am using Telegram.',
          ),
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildQRCodeIcon() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,

        borderRadius: BorderRadius.circular(100),
      ),
      child: const Icon(CupertinoIcons.qrcode, color: Colors.black),
    );
  }

  Widget _buildAvatarTile() {
    return CupertinoListTile(
      leading: SvgPicture.asset(
        'assets/icons/whats_app_person.svg',
        width: 24,
        height: 24,
      ),
      title: Text('Avatar', style: AppTextStyle.getSettingsText()),
      trailing: const Icon(
        CupertinoIcons.chevron_right,
        size: 16,
        color: AppColors.iconGrey,
      ),
      onTap: () {},
    );
  }

  Widget _buildSettingsTile({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return CupertinoListTile(
      leading: icon,
      title: Text(title, style: AppTextStyle.getSettingsText()),
      trailing: const Icon(
        CupertinoIcons.chevron_right,
        size: 16,
        color: AppColors.iconGrey,
      ),
      onTap: onTap,
    );
  }
}
