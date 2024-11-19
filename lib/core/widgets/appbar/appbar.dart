import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? titleColor;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  Appbar(
      {super.key,
      this.title,
      this.titleWidget,
      this.onBack,
      this.actions,
      this.backgroundColor,
      this.titleColor});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.transparent,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          spaceW16,
          AppButton(
            flex: 0,
            shape: BoxShape.circle,
            icon: AppIcon.arrowLeft,
            backgroundColor: AppColor.white,
            padding: EdgeInsets.all(8.w),
            onPressed: onBack != null
                ? () => onBack!()
                : () => GoRouter.of(context).pop(),
          ),
        ],
      ),
      centerTitle: true,
      title: titleWidget ??
          Text(
            title ?? '',
            style: textTheme.titleMedium!.copyWith(
              color: titleColor ?? AppColor.primaryText,
            ),
          ),
      actions: actions,
    );
  }
}
