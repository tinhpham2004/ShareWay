import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;

  AppButton({
    super.key,
    this.title,
    this.onPressed,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: isEnabled ? backgroundColor ?? AppColor.primaryColor : AppColor.secondary200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title ?? '',
            style: textTheme.titleSmall!.copyWith(
              color: isEnabled ? textColor ?? AppColor.white : AppColor.secondary300,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
