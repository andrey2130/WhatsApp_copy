import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:telegram_copy/core/theme/app_colors.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/common.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText; // ← new
  final String? hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;
  final bool hasClearButton;
  final TextInputAction? textInputAction;
  final bool showError;
  final VoidCallback? onClear;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderSide? focusedBorderSide;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final Widget? sufix2Icon;
  final double? radius;
  final Color? floatingLabelColor;
  const CustomTextField({
    required this.controller, super.key,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
    this.hasClearButton = false,
    this.textInputAction,
    this.showError = false,
    this.onClear,
    this.focusNode,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.height,
    this.backgroundColor = Colors.white,
    this.borderSide,
    this.focusedBorderSide,
    this.hintStyle,
    this.prefixIcon,
    this.sufixIcon,
    this.sufix2Icon,
    this.radius = 8.0,
    this.floatingLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height ?? 48.h,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            style: AppTextStyle.getInputTextfield(context),
            maxLength: maxLength,
            minLines: minLines,
            maxLines: maxLines ?? 1,
            keyboardType: keyboardType,
            obscureText: isPassword && !isPasswordVisible,
            onChanged: onChanged,
            textInputAction: textInputAction,
            cursorColor: AppColors.primaryBlue,
            cursorHeight: 16.h,
            decoration:
                Common.getInputDecoration(
                  context,
                  hintText ?? '',
                  prefixIcon: prefixIcon,
                  suffixIcon: sufixIcon ?? _buildSuffixIcon(),
                ).copyWith(
                  filled: backgroundColor != null,
                  fillColor: backgroundColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        borderSide ?? BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(radius!.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        focusedBorderSide ??
                        const BorderSide(color: AppColors.primaryBlue),
                    borderRadius: BorderRadius.circular(radius!.r),
                  ),

                  // Floating-label settings
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: AppTextStyle.getInputTextfield(context)
                      .copyWith(
                        color: floatingLabelColor ?? AppColors.primaryBlue,
                      ),

                  // Optional inline hint when empty
                  hintText: hintText,
                  hintStyle: hintStyle,
                  prefixIcon: prefixIcon,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                ),
          ),
        ),
        if (validator != null && showError)
          Builder(
            builder: (context) {
              final errorText = validator!(controller.text);
              if (errorText != null) {
                return Padding(
                  padding: EdgeInsets.only(top: 4.h, left: 16.w),
                  child: Text(
                    errorText,
                    style: AppTextStyle.getInputTextfield(context),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (isPassword) {
      return IconButton(
        alignment: Alignment.center,
        icon: isPasswordVisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),

        onPressed: onTogglePasswordVisibility,
      );
    }
    if (hasClearButton) {
      return IconButton(
        icon: const Icon(Icons.close),

        onPressed: () {
          controller.clear();
          onClear?.call();
        },
      );
    }
    return null;
  }
}
