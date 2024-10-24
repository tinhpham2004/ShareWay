import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_name.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPersistentBottomSheet();
    });
  }

  Widget _buildBottomSheetContent() {
    return Transform.translate(
      offset: const Offset(0, 24.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24.0, left: 16.0, right: 16.0),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.c_403A3A3A,
              offset: Offset(4, 4),
              blurRadius: 70,
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
                    color: AppColor.primaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            spaceH12,
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
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
                spaceW16,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.c_40C8C8C8,
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        AppIcon.giveRideService,
                        spaceH16,
                        Text(
                          'Cho đi nhờ',
                          style: textTheme.headlineSmall!.copyWith(
                            color: AppColor.primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            spaceH24,
          ],
        ),
      ),
    );
  }

  void _showPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => _buildBottomSheetContent(),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: const BottomNavigation(initialIndex: 0),
      body: Stack(
        children: [
          Assets.images.map.image(),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColor.secondary300,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                    top: 16.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
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
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: AppColor.secondary300,
                  ),
                ),
                margin: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Assets.icons.homeNotification.svg(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
