import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';

class AppInputDecoration {
  static InputDecoration textField({
    required BuildContext context,
    String? hintext,
    Widget? suffixIcon,
    String? errorText,
    bool? isContentPadding,
  }) {
    return InputDecoration(
      hintText: hintext,
      hintStyle: textTheme.labelLarge!.copyWith(
        color: AppColor.secondary300,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: isContentPadding == true ? EdgeInsets.all(8.w) : null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.secondary300,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.secondary300,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.error,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      errorText: errorText,
      errorStyle: textTheme.labelMedium!.copyWith(
        color: AppColor.error,
        fontWeight: FontWeight.w500,
      ),
      suffixIcon: suffixIcon,
    );
  }

  static InputDecoration otpField({
    required BuildContext context,
    String? hintext,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintext,
      hintStyle: textTheme.labelLarge!.copyWith(
        color: AppColor.secondary300,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(8.w),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.secondary300,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.secondary300,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.error,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorText: errorText,
      errorStyle: textTheme.labelSmall!.copyWith(color: AppColor.error),
    );
  }
}
