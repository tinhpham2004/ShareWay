import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/bloc/manage_vehicle_bloc.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/bloc/manage_vehicle_state.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/widgets/dashed_border.dart';

class ManageVehicleScreen extends StatefulWidget {
  const ManageVehicleScreen({super.key});

  @override
  State<ManageVehicleScreen> createState() => _ManageVehicleScreenState();
}

class _ManageVehicleScreenState extends State<ManageVehicleScreen> {
  late ManageVehicleBloc bloc;

  @override
  void initState() {
    bloc = ManageVehicleBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocListener<ManageVehicleBloc, ManageVehicleState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<ManageVehicleBloc, ManageVehicleState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(title: 'Quản lý phương tiện'),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        key: ObjectKey(state.dataChange),
                        children: [
                          _buildVehicleList(),
                          _buildAddVehicleButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container _buildAddVehicleButton() {
    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 8.h,
      ),
      child: InkWell(
        onTap: () => bloc.onAddVehicle(context),
        child: CustomPaint(
          painter: DashedBorder(),
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.addLocation,
                spaceW4,
                Text(
                  'Thêm phương tiện',
                  style: textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleList() {
    return BlocBuilder<ManageVehicleBloc, ManageVehicleState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 24.h,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.c_40D6D4D4,
                offset: Offset(0, 4.h),
                blurRadius: 20.r,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.vehicles.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColor.secondary100,
                  ),
                ),
              ],
            ),
            itemBuilder: (context, index) {
              final vehicle = state.vehicles[index];
              return ListTile(
                leading: AppIcon.motorbike,
                title: Text(
                  vehicle.name ?? '',
                  style: textTheme.bodyLarge!
                      .copyWith(color: AppColor.secondary400),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
