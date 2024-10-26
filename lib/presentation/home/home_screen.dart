import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_name.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/core/widgets/map/goong_map.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_bloc.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPersistentBottomSheet();
    });
  }

  void _showPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => _buildBottomSheetContent(),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: const BottomNavigation(initialIndex: 0),
            body: Stack(
              children: [
                if (state.isLoading)
                  LoadingScreen()
                else
                  GoongMap(
                    initialLocation: state.currentLocation,
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColor.secondary300,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 16.w,
                          right: 8.w,
                          top: 16.h,
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            spaceW8,
                            Text(
                              'Vị trí hiện tại',
                              style: textTheme.bodyLarge!
                                  .copyWith(color: AppColor.secondaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColor.secondary300,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        right: 16.w,
                        top: 16.h,
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Assets.icons.homeNotification.svg(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomSheetContent() {
    return Transform.translate(
      offset: Offset(0, 24.h),
      child: Container(
        padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.c_403A3A3A,
              offset: Offset(4.w, 4.h),
              blurRadius: 70.r,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spaceH12,
            const Row(
              children: [
                Spacer(),
                Expanded(
                  child: Divider(
                    color: AppColor.secondary300,
                    thickness: 5,
                  ),
                ),
                Spacer(),
              ],
            ),
            spaceH24,
            Row(
              children: [
                Text(
                  'Dịch vụ của $appName',
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            spaceH12,
            Row(
              children: [
                _buildHitchRideServiceButton(),
                spaceW16,
                _buildGiveRideServiceButton(),
              ],
            ),
            spaceH24,
          ],
        ),
      ),
    );
  }

  Widget _buildGiveRideServiceButton() {
    return Expanded(
      child: InkWell(
        onTap: () => bloc.onGiveRidePressed(context),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.c_40C8C8C8,
                offset: Offset(0, 4.h),
                blurRadius: 30.r,
                spreadRadius: 0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            children: [
              AppIcon.giveRideService,
              spaceH16,
              Text(
                'Cho đi nhờ',
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHitchRideServiceButton() {
    return Expanded(
      child: InkWell(
        onTap: () => bloc.onHitchRidePressed(context),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            children: [
              AppIcon.hitchRideService,
              spaceH16,
              Text(
                'Đi nhờ',
                style: textTheme.headlineSmall!.copyWith(
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
