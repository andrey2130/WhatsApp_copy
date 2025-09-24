import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/android/about_screen_android.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/ios/about_screen_ios.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? const AboutScreenAndroid() : const AboutScreenIos();
  }
}
