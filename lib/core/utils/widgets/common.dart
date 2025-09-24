import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';

// ignore: public_member_api_docs
class Common {
  static InputDecoration getInputDecoration(
    BuildContext context,
    String hintText, {
    Widget? suffixIcon, Widget? prefixIcon,
  }) {
    const borderRadius = BorderRadius.all(Radius.circular(8.0));

    const errorBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColors.primaryBlue),
    );
    const defaultBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColors.borderColor),
    );

    return InputDecoration(
      enabledBorder: defaultBorder,
      focusedBorder: defaultBorder,
      border: defaultBorder,
      focusedErrorBorder: errorBorder,
      errorBorder: errorBorder,
      filled: true,
      hintStyle: AppTextStyle.getInputTextfield(context).copyWith(
        color: const Color(0xFF707070),
      ),
      hintText: hintText,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      suffixIcon: suffixIcon,
    );
  }
}
