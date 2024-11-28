import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/image/app_image.dart';
import 'package:share_way_frontend/presentation/account/bloc/account_bloc.dart';
import 'package:share_way_frontend/presentation/account/bloc/account_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AccountBloc bloc;

  @override
  void initState() {
    bloc = AccountBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'Trang cá nhân'),
      bottomNavigationBar: BottomNavigation(initialIndex: 3),
      backgroundColor: AppColor.white,
      body: BlocProvider(
        create: (context) => bloc..onStart(context),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => showImagePicker(),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          AppAvatar(avatarUrl: state.user?.avatarUrl ?? ''),
                          AppIcon.editAvatar,
                        ],
                      ),
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.user?.fullName ?? '',
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
                spaceH16,
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final setting = state.settings[index];
                      return ListTile(
                        leading: setting.icon,
                        title: Text(
                          setting.title ?? '',
                          style: textTheme.titleMedium!.copyWith(
                            color: setting.titleColor ?? AppColor.primaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: index != state.settings.length - 1
                            ? AppIcon.arrow_forward_ios_outlined
                            : null,
                        onTap: () => bloc.onSettingSelect(context, index),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Divider(color: AppColor.secondary100),
                    ),
                    itemCount: state.settings.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> showImagePicker() async {
    showModalBottomSheet(
      backgroundColor: AppColor.white,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColor.transparent,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bloc,
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              return Container(
                height: 0.5.sh,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tất cả ảnh',
                            style: textTheme.titleMedium,
                          ),
                          InkWell(
                            onTap: state.selectedImage != null
                                ? () => bloc.onCropImage(context)
                                : null,
                            child: Text(
                              'Chọn',
                              style: textTheme.titleSmall!.copyWith(
                                color: state.selectedImage != null
                                    ? AppColor.primaryColor
                                    : AppColor.secondary300,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: state.assets.length,
                        itemBuilder: (context, index) {
                          final asset = state.assets[index];
                          return InkWell(
                            onTap: () => bloc.onSelectImage(
                                asset == state.selectedImage ? null : asset),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.file(
                                    asset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.selectedImage == asset
                                          ? AppColor.primaryColor
                                          : AppColor.white,
                                      border: Border.all(
                                        color: state.selectedImage == asset
                                            ? AppColor.primaryColor
                                            : AppColor.secondary300,
                                        width: 2.w,
                                      ),
                                    ),
                                    child: state.selectedImage == asset
                                        ? AppIcon.check
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
