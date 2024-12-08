import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/date_time.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_bloc.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_state.dart';

class PendingHitchRideField extends StatefulWidget {
  const PendingHitchRideField({
    super.key,
  });

  @override
  State<PendingHitchRideField> createState() => _PendingHitchRideFieldState();
}

class _PendingHitchRideFieldState extends State<PendingHitchRideField> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PendingRideBloc>();
    return BlocBuilder<PendingRideBloc, PendingRideState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 24.h,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            reverse: true,
            itemCount: state.pendingRideRequest.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => spaceH8,
            itemBuilder: (context, index) {
              final item = state.pendingRideRequest[index];
              return InkWell(
                onTap: () => bloc.onSelectHitchRide(
                  context: context,
                  selectedIndex: index,
                ),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.secondary200),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                AppIcon.location_outlined,
                                Flexible(
                                  child: Text(
                                    '${item.distance} km',
                                    style: textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                AppIcon.time,
                                Flexible(
                                  child: Text(
                                    '${item.duration} phút',
                                    style: textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      spaceH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ngày giờ',
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColor.secondaryColor,
                            ),
                          ),
                          Text(
                            '${item.startTime?.format(pattern: dd_mm_yyyy)} | ${item.startTime?.format(pattern: hh_mm_a)}',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      spaceH8,
                      _buildLocationInputField(currentIndex: index),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
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

  Widget _buildLocationInputField({required int currentIndex}) {
    return BlocBuilder<PendingRideBloc, PendingRideState>(
      builder: (context, state) {
        final locationList = [
          state.pendingRideRequest[currentIndex].startAddress,
          state.pendingRideRequest[currentIndex].endAddress,
        ];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.only(bottom: 8.h),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: locationList.length,
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
                      if (index != (locationList.length ?? 0) - 1)
                        _buildDashedLine()
                      else
                        spaceH8,
                    ],
                  ),
                  spaceW8,
                  Expanded(
                    child: TextFormField(
                      initialValue: locationList[index],
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
}
