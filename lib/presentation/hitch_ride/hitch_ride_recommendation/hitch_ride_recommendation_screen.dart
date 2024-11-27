import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/image/app_image.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation/bloc/hitch_ride_recommendation_bloc.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation/bloc/hitch_ride_recommendation_state.dart';

class HitchRideRecommendationScreen extends StatefulWidget {
  final String hitchRideId;
  const HitchRideRecommendationScreen({super.key, required this.hitchRideId});

  @override
  State<HitchRideRecommendationScreen> createState() =>
      _HitchRideRecommendationScreenState();
}

class _HitchRideRecommendationScreenState
    extends State<HitchRideRecommendationScreen> {
  late HitchRideRecommendationBloc bloc;

  @override
  void initState() {
    bloc = HitchRideRecommendationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          bloc..onStart(context: context, hitchRideId: widget.hitchRideId),
      child: BlocListener<HitchRideRecommendationBloc,
          HitchRideRecommendationState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<HitchRideRecommendationBloc,
            HitchRideRecommendationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(title: 'Người cho đi nhờ đề xuất'),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        key: ObjectKey(state.dataChange),
                        children: [
                          _buildGiveRideRecommendationList(),
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

  Widget _buildGiveRideRecommendationList() {
    return BlocBuilder<HitchRideRecommendationBloc,
        HitchRideRecommendationState>(
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
            itemCount: state.giveRideRecommendationList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => spaceH8,
            itemBuilder: (context, index) {
              final item = state.giveRideRecommendationList[index];
              return InkWell(
                onTap: () =>
                    bloc.onSelectedGiver(context: context, index: index),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.secondary200),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ListTile(
                    leading: AppAvatar(
                      avatarUrl: item.user?.avatarUrl ?? '',
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item.user?.fullName ?? '',
                            style: textTheme.titleSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            item.fare != null ? '${item.fare}đ' : '',
                            style: textTheme.titleSmall!.copyWith(
                              color: AppColor.primaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${item.distance}km - ${item.duration} phút',
                            style: textTheme.bodyMedium!
                                .copyWith(color: AppColor.secondary400),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    // trailing: Text(
                    //   item.fare != null ? '${item.fare}đ' : '',
                    //   style: textTheme.titleSmall!.copyWith(
                    //     color: AppColor.primaryColor,
                    //   ),
                    //   overflow: TextOverflow.ellipsis,
                    // ),
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
