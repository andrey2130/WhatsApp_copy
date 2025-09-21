import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? avatarWidget;
  final Widget? left2Widget;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final Widget? right2Widget;
  final Widget? right3Widget;

  const CustomAppBar({
    super.key,
    this.leftWidget,
    this.avatarWidget,
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
            if (avatarWidget != null) ...[
              const SizedBox(width: 8),
              avatarWidget!,
            ],
            if (left2Widget != null) ...[
              const SizedBox(width: 8),
              left2Widget!,
            ],
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
