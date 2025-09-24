import 'package:flutter/material.dart';

import 'package:telegram_copy/feature/settings/presentation/bloc/settings_bloc.dart';

class UserAvatarWidget extends StatelessWidget {
  final String? photoUrl;
  final double width;
  final double height;
  final SettingsState? state;

  const UserAvatarWidget({
    super.key,
    this.photoUrl,
    this.state,
    this.width = 120,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    Widget avatar;

    if (photoUrl != null && photoUrl!.trim().isNotEmpty) {
      avatar = Image.network(
        photoUrl!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if (state != null) {
      avatar = state!.maybeWhen(
        loading: () => const CircularProgressIndicator.adaptive(),
        success: (user) => user.photoUrl.isNotEmpty
            ? Image.network(
                user.photoUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/avatar.jpg',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
        orElse: () => Image.asset(
          'assets/images/avatar.jpg',
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      );
    } else {
      avatar = Image.asset(
        'assets/images/avatar.jpg',
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: avatar,
    );
  }
}
