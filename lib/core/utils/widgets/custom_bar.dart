import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final Widget? right2Widget;
  final Widget? right3Widget;

  const CustomAppBar({
    super.key,
    this.leftWidget,
    this.centerWidget,
    this.rightWidget,
    this.right2Widget,
    this.right3Widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget ?? const SizedBox.shrink(),
        centerWidget ?? const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            rightWidget ?? const SizedBox.shrink(),
            if (right2Widget != null) ...[right2Widget!],
            if (right3Widget != null) ...[right3Widget!],
          ],
        ),
      ],
    );
  }
}
