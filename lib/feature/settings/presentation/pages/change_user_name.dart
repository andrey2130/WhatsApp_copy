import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/android/change_user_name_android.dart';
import 'package:telegram_copy/feature/settings/presentation/pages/ios/change_user_name_ios.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? ChangeUserNameAndroid() : ChangeUserNameIos();
  }
}
