import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:share_way_frontend/presentation/onboarding/bloc/onboarding_state.dart';
import 'package:share_way_frontend/presentation/onboarding/widgets/curved_rectangle_cipper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingBloc bloc;

  @override
  void initState() {
    bloc = OnboardingBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBackground(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        _buildHeader(),
                        spaceH24,
                        _buildSmallText(),
                        spaceH24,
                        _buildButton(context),
                        spaceH24,
                        _buildLoginField(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildLoginField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bạn đã có tài khoản? ',
          style: textTheme.titleSmall!.copyWith(
            color: AppColor.primaryText,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () => bloc.onLoginPressed(context),
          child: Text(
            'Đăng nhập',
            style: textTheme.titleSmall!.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Row _buildButton(BuildContext context) {
    return Row(
      children: [
        AppButton(
          title: 'Bắt đầu',
          onPressed: () => bloc.onStartPressed(context),
        ),
      ],
    );
  }

  Text _buildSmallText() {
    return Text(
      'Welcome to the furniture shopping app, where we provide a convenient and diverse',
      style: textTheme.bodyMedium!.copyWith(color: AppColor.secondaryColor),
      textAlign: TextAlign.center,
    );
  }

  RichText _buildHeader() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Welcome to Your ',
            style: textTheme.headlineMedium!.copyWith(
              color: AppColor.primaryText,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'Ultimate Transportation Solution',
            style: textTheme.headlineMedium!.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  ClipPath _buildBackground() {
    return ClipPath(
      clipper: CurvedRectangleClipper(),
      child: Stack(
        children: [
          Container(
            height: 0.6.sh,
            color: AppColor.secondary150,
            child: Assets.images.onboardingMan.image(),
          ),
          Positioned(
            top: 80.h,
            left: 40.w,
            child: AppIcon.onboardingLocationMark,
          ),
          Positioned(
            top: 80.h,
            left: 250.w,
            child: AppIcon.onboardingPerson,
          ),
          Positioned(
            top: 160.h,
            child: AppIcon.onboardingChat,
          ),
          Positioned(
            top: 160.h,
            left: 295.w,
            child: AppIcon.onboardingCall,
          ),
        ],
      ),
    );
  }
}
