import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/android/user_setting_screen_android.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/ios/user_setting_screen_ios.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const UserSettingScreenAndroid()
        : const UserSettingScreenIos();
  }
}
