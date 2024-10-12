import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:camera/camera.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/take_photo_id_card_bloc.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/take_photo_id_card_state.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/button_title_enum.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/take_photo_id_card_enum.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/widgets/hole_clipper.dart';

class TakePhotoIdCardScreen extends StatefulWidget {
  @override
  _TakePhotoIdCardScreenState createState() => _TakePhotoIdCardScreenState();
}

class _TakePhotoIdCardScreenState extends State<TakePhotoIdCardScreen> {
  late TakePhotoIdCardBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = TakePhotoIdCardBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context),
      child: BlocBuilder<TakePhotoIdCardBloc, TakePhotoIdCardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoadingScreen();
          }
          return Scaffold(
            body: Stack(
              children: [
                _buildCamera(state),
                _buildIdCardField(state),
                _buildFourRoundedCorners(),
                _buildButonField(state),
                _buildHeader(state),
                _buildBackButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned _buildBackButton() {
    return Positioned(
      top: 30.h,
      left: 0,
      right: 0,
      child: Row(
        children: [
          AppButton(
            shape: BoxShape.circle,
            icon: AppIcon.arrowLeft,
            backgroundColor: AppColor.white,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            onPressed: () => bloc.onBack(context),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }

  Positioned _buildHeader(TakePhotoIdCardState state) {
    return Positioned(
      top: 30.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            state.screen.title,
            style: textTheme.titleMedium!.copyWith(
              color: AppColor.primaryText,
            ),
          ),
          spaceH24,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon.shield_check,
              Text(
                'Vui lòng căn đặt CCCD vào đúng vị trí',
                style: textTheme.labelLarge!.copyWith(
                  color: AppColor.secondary300,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Scaffold _buildLoadingScreen() {
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
        ),
      ),
    );
  }

  Column _buildCamera(TakePhotoIdCardState state) {
    return Column(
      children: [
        Expanded(
          child: state.buttonTitle == ButtonTitleEnum.resume
                ? state.screen == TakePhotoIdCardEnum.frontSide
                    ? Image.file(state.frontSideImage!)
                    : Image.file(state.backSideImage!)
                : CameraPreview(state.cameraController!),
        ),
      ],
    );
  }

  Positioned _buildIdCardField(TakePhotoIdCardState state) {
    return Positioned.fill(
      child: Center(
        child: ClipPath(
          clipper: HoleClipper(),
          child: Container(
            color: Colors.white.withOpacity(0.88),
          ),
        ),
      ),
    );
  }

  Center _buildFourRoundedCorners() {
    return Center(
      child: Container(
        width: 305.w,
        height: 185.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Stack(
          children: [
            // Top-left corner
            _buildRoundedCorner(
                top: 0, left: 0, topLeft: Radius.circular(10.r)),
            // Top-right corner
            _buildRoundedCorner(
                top: 0, right: 0, topRight: Radius.circular(10.r)),
            // Bottom-left corner
            _buildRoundedCorner(
                bottom: 0, left: 0, bottomLeft: Radius.circular(10.r)),
            // Bottom-right corner
            _buildRoundedCorner(
                bottom: 0, right: 0, bottomRight: Radius.circular(10.r)),
          ],
        ),
      ),
    );
  }

  Positioned _buildButonField(TakePhotoIdCardState state) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.r),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppButton(
                  title: state.buttonTitle.title,
                  onPressed: () => bloc.onConfirmButtonPressed(context),
                ),
              ],
            ),
            if (state.buttonTitle == ButtonTitleEnum.resume) ...[
              spaceH12,
              Row(
                children: [
                  AppButton(
                    title: 'Chụp lại',
                    backgroundColor: AppColor.primary100,
                    textColor: AppColor.primaryColor,
                    onPressed: () => bloc.onRetakeButtonPressed(context),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Positioned _buildRoundedCorner({
    double? left,
    double? top,
    double? right,
    double? bottom,
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          border: Border(
            top: top != null
                ? const BorderSide(color: AppColor.primaryColor, width: 5.0)
                : BorderSide.none,
            left: left != null
                ? const BorderSide(color: AppColor.primaryColor, width: 5.0)
                : BorderSide.none,
            right: right != null
                ? const BorderSide(color: AppColor.primaryColor, width: 5.0)
                : BorderSide.none,
            bottom: bottom != null
                ? const BorderSide(color: AppColor.primaryColor, width: 5.0)
                : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: topLeft ?? Radius.zero,
            topRight: topRight ?? Radius.zero,
            bottomLeft: bottomLeft ?? Radius.zero,
            bottomRight: bottomRight ?? Radius.zero,
          ),
        ),
      ),
    );
  }
}
