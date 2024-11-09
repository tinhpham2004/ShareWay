import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/core/widgets/radio_button/app_radio_button.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_pick_time/bloc/hitch_ride_pick_time_bloc.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_pick_time/bloc/hitch_ride_pick_time_state.dart';

class HitchRidePickTimeScreen extends StatefulWidget {
  final CreateHitchRideInput data;
  const HitchRidePickTimeScreen({super.key, required this.data});

  @override
  State<HitchRidePickTimeScreen> createState() =>
      _HitchRidePickTimeScreenState();
}

class _HitchRidePickTimeScreenState extends State<HitchRidePickTimeScreen> {
  late HitchRidePickTimeBloc bloc;

  @override
  void initState() {
    bloc = HitchRidePickTimeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(widget.data),
      child: BlocListener<HitchRidePickTimeBloc, HitchRidePickTimeState>(
        listener: (context, state) {
          if (state.selectedRadioIndex == 1) {
            showDatePickerBottomSheet(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.selectedRadioIndex != current.selectedRadioIndex,
        child: BlocBuilder<HitchRidePickTimeBloc, HitchRidePickTimeState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(
                title: 'Chọn thời gian chuyến đi',
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        key: ObjectKey(state.dataChange),
                        children: [
                          _buildLocationInputField(),
                          Row(
                            children: [
                              spaceW16,
                              Text(
                                'Chọn thời gian đi',
                                style: textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          _buildTimeInputField(),
                        ],
                      ),
                    ),
                  ),
                  if (state.selectedRadioIndex == 0) _buildConfirmButton(),
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

  Widget _buildDashedLine() {
    return SizedBox(
      height: 8.h,
      width: 2.w,
      child: Column(
        children: List.generate(
          2,
          (index) => Expanded(
            child: Container(
              width: 2.w,
              color:
                  index % 2 == 0 ? AppColor.secondary300 : AppColor.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationInputField() {
    return BlocBuilder<HitchRidePickTimeBloc, HitchRidePickTimeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.w),
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
            itemCount: state.createHitchRideInput?.locationList?.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 28.sp,
                      child: _buildDashedLine(),
                    ),
                  ],
                ),
                const Expanded(
                  child: Divider(
                    color: AppColor.secondary300,
                  ),
                ),
              ],
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (index != 0) _buildDashedLine() else spaceH8,
                      index == 0
                          ? AppIcon.startLocation
                          : AppIcon.otherLocation,
                      if (index !=
                          (state.createHitchRideInput?.locationList?.length ??
                                  0) -
                              1)
                        _buildDashedLine()
                      else
                        spaceH8,
                    ],
                  ),
                  spaceW8,
                  Expanded(
                    child: TextFormField(
                      initialValue:
                          state.createHitchRideInput?.locationList?[index].name,
                      enabled: false,
                      style: textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTimeInputField() {
    return BlocBuilder<HitchRidePickTimeBloc, HitchRidePickTimeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 16.h,
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
            itemCount: state.timeList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              color: AppColor.secondary300,
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 0 ? AppIcon.rideClock : AppIcon.rideCalendar,
                    ],
                  ),
                  spaceW8,
                  Expanded(
                    child: TextFormField(
                      initialValue: state.timeList[index],
                      enabled: false,
                      style: textTheme.bodyLarge!
                          .copyWith(color: AppColor.secondary400),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  AppRadioButton(
                    value: index,
                    groupValue: state.selectedRadioIndex,
                    onChanged: (p0) => bloc.onSelectRadioIndex(p0),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void showDatePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
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
                spaceW16,
                Text(
                  'Chọn ngày đón',
                  style: textTheme.titleSmall,
                ),
              ],
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime date) {
                  bloc.onSelectDateTime(isDate: true, dateTime: date);
                },
              ),
            ),
            spaceH16,
            Row(
              children: [
                AppButton(
                  title: 'Xác nhận',
                  onPressed: () {
                    GoRouter.of(context).pop();
                    showTimePickerBottomSheet(context);
                  },
                )
              ],
            ),
            spaceH16,
          ],
        );
      },
    );
  }

  void showTimePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
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
                spaceW16,
                Text(
                  'Chọn giờ đón',
                  style: textTheme.titleSmall,
                ),
              ],
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime time) {
                  bloc.onSelectDateTime(isDate: false, dateTime: time);
                },
              ),
            ),
            spaceH16,
            Row(
              children: [
                AppButton(
                  title: 'Xác nhận',
                  onPressed: () {
                    bloc.onConfirm(context);
                  },
                )
              ],
            ),
            spaceH16,
          ],
        );
      },
    );
  }
}
