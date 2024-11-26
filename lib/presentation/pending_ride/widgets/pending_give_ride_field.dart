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

class PendingGiveRideField extends StatelessWidget {
  const PendingGiveRideField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            itemCount: state.pendingRideOffer.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => spaceH8,
            itemBuilder: (context, index) {
              final item = state.pendingRideOffer[index];
              return InkWell(
                // onTap: () =>
                //     bloc.onSelectedGiver(context: context, index: index),
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
                          Expanded(
                            child: Row(
                              children: [
                                AppIcon.wallet,
                                Flexible(
                                  child: Text(
                                    '${item.fare}đ',
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
}