import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double height;
  final String text;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? borderWidth;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Widget? icon;
  final Color? iconColor;
  final TextStyle? textStyle;
  final bool hasShadow;
  final Widget? svgPicture;
  final bool isLoading;
  final bool? showAnimation;

  const CustomButton({
    required this.height,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
    super.key,
    this.width,
    this.padding,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.icon,
    this.iconColor,
    this.textStyle,
    this.hasShadow = true,
    this.svgPicture,
    this.isLoading = false,
    this.showAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth ?? 1.w)
                : BorderSide.none,
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w),
          elevation: 0,
          shadowColor: Colors.transparent,
          overlayColor: showAnimation! ? null : Colors.transparent,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPicture != null)
              svgPicture!
            else if (icon != null)
              icon ?? const SizedBox.shrink(),
            if (svgPicture != null || icon != null) SizedBox(width: 8.w),
            Flexible(
              child: Text(
                text,
                style:
                    textStyle ??
                    TextStyle(color: textColor, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
