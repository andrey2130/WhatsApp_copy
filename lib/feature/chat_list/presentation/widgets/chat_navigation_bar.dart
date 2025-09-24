import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram_copy/core/theme/text_style.dart';
import 'package:telegram_copy/core/utils/widgets/user_avatar_widget.dart';

class ChatNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const ChatNavigationBar({
    super.key,
    required this.userName,
    this.avatarUrl,
    required this.onBack,
  });

  final String userName;
  final String? avatarUrl;
  final VoidCallback onBack;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      border: null,
      padding: const EdgeInsetsDirectional.only(start: 0, end: 8),
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onBack,
        child: const Icon(CupertinoIcons.back, size: 26),
      ),
      middle: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserAvatarWidget(height: 36, width: 36, photoUrl: avatarUrl),
            SizedBox(width: 8.w),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    maxLines: 1,
                    style: AppTextStyle.getRegularBlack().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'tap here for contact info',
                    maxLines: 1,
                    style: AppTextStyle.getGreySettingsText(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/video_camera.svg'),
          SizedBox(width: 16.w),
          SvgPicture.asset('assets/icons/phone_icon.svg'),
        ],
      ),
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
