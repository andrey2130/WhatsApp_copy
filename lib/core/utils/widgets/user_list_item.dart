import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListItem extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? meta;
  final Widget? badge;
  final List<Widget> trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const UserListItem({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.meta,
    this.badge,
    this.trailing = const [],
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            if (leading != null) leading!,
            if (leading != null) SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: title),
                      if (meta != null) meta!,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: subtitle ?? const SizedBox.shrink()),
                      if (badge != null) badge!,
                      if (trailing.isNotEmpty) ...[
                        SizedBox(width: 8.w),
                        Row(mainAxisSize: MainAxisSize.min, children: trailing),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
