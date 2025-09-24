import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/android/setting_screen_android.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/ios/setting_screen_ios.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Platform.isAndroid ? const SettingScreenAndroid() : const SettingScreenIos();
  }
}
