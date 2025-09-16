import 'package:flutter/material.dart';

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
