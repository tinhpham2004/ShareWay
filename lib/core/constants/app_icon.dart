// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
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
  static Widget hitchRideService = Assets.icons.hitchRideService.svg();
  static Widget giveRideService = Assets.icons.giveRideService.svg();
  static Widget mapButton = Assets.icons.mapButton.svg();
  static Widget backToCurrentLocation =
      Assets.icons.backToCurrentLocation.svg();

  static Icon startLocation = Icon(
    Icons.radio_button_checked,
    size: size + 12.sp,
  );
  static Icon otherLocation = Icon(
    Icons.location_on_rounded,
    color: AppColor.primaryColor,
    size: size + 12.sp,
  );
  static Widget swapLocation = Assets.icons.swapLocation.svg(
    height: 25.h,
    width: 25.w,
  );
  static Icon addLocation = Icon(
    Icons.add_rounded,
    color: AppColor.primaryColor,
    size: size + 12.sp,
  );
  static Icon deleteLocation = Icon(
    Icons.clear_rounded,
    color: AppColor.primaryColor,
    size: size + 12.sp,
  );
  static Icon time = const Icon(
    Icons.access_time,
    color: AppColor.primaryColor,
  );

  static Icon rideClock = const Icon(
    Icons.access_time_filled_rounded,
    color: AppColor.primaryColor,
  );

  static Icon search = const Icon(
    Icons.search,
    color: AppColor.primaryColor,
  );

  static Widget rideCalendar = Assets.icons.rideCalendar.svg();
  static Widget motorbike = Assets.icons.motorbike.svg();
  static Widget money = Assets.icons.money.svg();
  static Widget giveRideComplete = Assets.icons.giveRideComplete.svg();
  static Widget hitchRideComplete = Assets.icons.hitchRideComplete.svg();
  static Widget audioCall = Assets.icons.audioCall.svg();
  static Widget audioCallMessage = Assets.icons.audioCallMessage.svg();
  static Widget missedAudioCallMessage =
      Assets.icons.missedAudioCallMessage.svg();
  static Widget pickImage = Assets.icons.pickImage.svg(
    fit: BoxFit.scaleDown,
  );
  static Widget sendMessage = Assets.icons.sendMessage.svg();
  static Widget rideCall = Assets.icons.rideCall.svg();
  static Widget rideChat = Assets.icons.rideChat.svg();
  static Widget check = Icon(
    Icons.check,
    size: size,
    color: Colors.white,
  );
}
