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
import 'package:share_way_frontend/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/core/widgets/map/pick_location_map.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_bloc.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  final ValueNotifier<bool> _isExpanded = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
    _draggableScrollableController.addListener(() {
      _isExpanded.value = _draggableScrollableController.size > 0.15;
    });
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const BottomNavigation(initialIndex: 0),
            body: Stack(
              children: [
                PickLocationMap(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildServiceBottomSheet(),
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
                    InkWell(
                      onTap: () => bloc.onPendingRidePressed(context),
                      child: Container(
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
                        child: AppIcon.homeClock,
                      ),
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

  Widget _buildServiceBottomSheet() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AppBottomSheet(
          height: 0.45.sh,
          draggableScrollableController: _draggableScrollableController,
          isExpanded: _isExpanded,
          body: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  spaceH12,
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
            )
          ],
        );
      },
    );
  }
}
