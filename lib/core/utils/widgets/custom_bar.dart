import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? left2Widget;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final Widget? right2Widget;
  final Widget? right3Widget;

  const CustomAppBar({
    super.key,
    this.leftWidget,
    this.left2Widget,
    this.centerWidget,
    this.rightWidget,
    this.right2Widget,
    this.right3Widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leftWidget ?? const SizedBox.shrink(),
            if (left2Widget != null) left2Widget!,
          ],
        ),
        Expanded(child: Center(child: centerWidget ?? const SizedBox.shrink())),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            rightWidget ?? const SizedBox.shrink(),
            if (right2Widget != null) right2Widget!,
            if (right3Widget != null) right3Widget!,
          ],
        ),
      ],
    );
  }
}
