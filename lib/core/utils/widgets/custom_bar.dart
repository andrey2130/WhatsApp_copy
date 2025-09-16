import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? centerWidget;
  final Widget? rightWidget;

  const CustomAppBar({
    super.key,
    this.leftWidget,
    this.centerWidget,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget ?? SizedBox.shrink(),
        centerWidget ?? SizedBox.shrink(),
        rightWidget ?? SizedBox.shrink(),
      ],
    );
  }
}
