import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle getHeader() {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Text',
    );
  }
static TextStyle getRegularBlack() {
  return const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Text',

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
}
