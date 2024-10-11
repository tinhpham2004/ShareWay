import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:camera/camera.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/verify_id_card_bloc.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/verify_id_card_state.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/widgets/hole_clipper.dart';

class VerifyFrontSideCardScreen extends StatefulWidget {
  @override
  _VerifyFrontSideCardScreenState createState() =>
      _VerifyFrontSideCardScreenState();
}

class _VerifyFrontSideCardScreenState extends State<VerifyFrontSideCardScreen> {
  late VerifyIdCardBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = VerifyIdCardBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context),
      child: BlocBuilder<VerifyIdCardBloc, VerifyIdCardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoadingScreen();
          }
          return Scaffold(
            body: Stack(
              children: [
                _buildCamera(state),
                _buildIdCardField(),
                _buildFourRoundedCorners(),
                _buildButonField(),
              ],
            ),
          );
        },
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

  Column _buildCamera(VerifyIdCardState state) {
    return Column(
                children: [
                  Expanded(
                    child: CameraPreview(state.cameraController!),
                  ),
                ],
              );
  }

  Positioned _buildIdCardField() {
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
                          bottom: 0,
                          left: 0,
                          bottomLeft: Radius.circular(10.r)),
                      // Bottom-right corner
                      _buildRoundedCorner(
                          bottom: 0,
                          right: 0,
                          bottomRight: Radius.circular(10.r)),
                    ],
                  ),
                ),
              );
  }

  Positioned _buildButonField() {
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
                            title: 'Xác nhận',
                          ),
                        ],
                      ),
                      spaceH12,
                      Row(
                        children: [
                          AppButton(
                            title: 'Chụp lại',
                            backgroundColor: AppColor.primary100,
                            textColor: AppColor.primaryColor,
                          ),
                        ],
                      ),
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
