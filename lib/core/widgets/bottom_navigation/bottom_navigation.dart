import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/router/app_path.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;
  const BottomNavigation({super.key, required this.initialIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(
            color: AppColor.c_FFECECEC,
            width: 2.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.c_40B6C8E4,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Assets.icons.home.svg(
                  color:
                      widget.initialIndex == 0 ? AppColor.primaryColor : null),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.activity.svg(
                  color:
                      widget.initialIndex == 1 ? AppColor.primaryColor : null),
              label: 'Hoạt động',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.chat.svg(
                  color:
                      widget.initialIndex == 2 ? AppColor.primaryColor : null),
              label: 'Nhắn tin',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.account.svg(
                  color:
                      widget.initialIndex == 3 ? AppColor.primaryColor : null),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: widget.initialIndex,
          selectedItemColor: AppColor.primaryColor,
          selectedLabelStyle: textTheme.bodySmall,
          showUnselectedLabels: true,
          unselectedLabelStyle: textTheme.bodySmall,
          unselectedItemColor: AppColor.secondary400,
          elevation: 0,
          onTap: (value) {
            switch (value) {
              case 0:
                GoRouter.of(context).go(AppPath.home);
                break;
              case 1:
                GoRouter.of(context).go(AppPath.activity);
                break;
              case 2:
                GoRouter.of(context).go(AppPath.chat);
                break;
              case 3:
                GoRouter.of(context).go(AppPath.account);
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}
