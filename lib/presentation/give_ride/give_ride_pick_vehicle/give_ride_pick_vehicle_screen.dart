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
import 'package:share_way_frontend/core/widgets/radio_button/app_radio_button.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/widgets/dashed_border.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_vehicle/bloc/give_ride_pick_vehicle_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_vehicle/bloc/give_ride_pick_vehicle_state.dart';

class GiveRidePickVehicleScreen extends StatefulWidget {
  final CreateGiveRideInput data;
  const GiveRidePickVehicleScreen({super.key, required this.data});

  @override
  State<GiveRidePickVehicleScreen> createState() =>
      _GiveRidePickVehicleScreenState();
}

class _GiveRidePickVehicleScreenState extends State<GiveRidePickVehicleScreen> {
  late GiveRidePickVehicleBloc bloc;

  @override
  void initState() {
    bloc = GiveRidePickVehicleBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context, data: widget.data),
      child: BlocListener<GiveRidePickVehicleBloc, GiveRidePickVehicleState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<GiveRidePickVehicleBloc, GiveRidePickVehicleState>(
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
                        ],
                      ),
                    ),
                  ),
                  _buildConfirmButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildConfirmButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Xác nhận',
              onPressed: () => bloc.onConfirm(context),
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  Widget _buildVehicleList() {
    return BlocBuilder<GiveRidePickVehicleBloc, GiveRidePickVehicleState>(
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppRadioButton(
                      value: index,
                      groupValue: state.selectedVehicleIndex,
                      onChanged: (value) => bloc.onSelectVehicle(value),
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
