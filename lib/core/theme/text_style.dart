import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle getHeader() {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
    );
  }

  static TextStyle getBoldGreen() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'SF Pro Text',
      color: Color(0xFF34C759),
    );
  }

  static TextStyle getFilterText() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Text',
      color: Colors.black45,
    );
  }

  static TextStyle getRegularBlack() {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
    );
  }

  static TextStyle getSettingsText() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
      color: Color(0xFF0A0A0A),
    );
  }

  static TextStyle getGreySettingsText() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'SF Pro Text',
      color: Color(0xFF767779),
    );
  }

  static TextStyle getSubtitle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontFamily: 'SF Pro Text',
    );
  }

  static TextStyle getInputTextfield(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      color: Color(0xFF3C3C43),
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
    );
  }

  static TextStyle getButtonText() {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
      color: Color(0xFF007AFF),
    );
  }

  static TextStyle getMessageBubleText() {
    return TextStyle(
      fontSize: 15.8.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
      color: const Color(0xFF0A0A0A),
    );
  }
}
