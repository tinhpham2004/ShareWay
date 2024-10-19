import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

final size = 16.sp;

class AppIcon {
  AppIcon._();

  static Widget clearData = Assets.icons.clearData.svg(fit: BoxFit.scaleDown);

  static Icon arrowLeft = Icon(
    Icons.arrow_back,
    size: size + 5.sp,
  );

  static Widget shield_check =
      Assets.icons.shieldCheck.svg(fit: BoxFit.scaleDown);
  static Widget google = Assets.icons.google.svg();
  static Widget onboardingLocationMark =
      Assets.icons.onboardingLocationMark.svg();
  static Widget onboardingPerson = Assets.icons.onboardingPerson.svg();
  static Widget onboardingChat = Assets.icons.onboardingChat.svg();
  static Widget onboardingCall = Assets.icons.onboardingCall.svg();
}
