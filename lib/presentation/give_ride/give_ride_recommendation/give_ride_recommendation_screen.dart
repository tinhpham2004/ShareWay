import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/bloc/give_ride_recommendation_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/bloc/give_ride_recommendation_state.dart';

class GiveRideRecommendationScreen extends StatefulWidget {
  final String giveRideId;
  const GiveRideRecommendationScreen({super.key, required this.giveRideId});

  @override
  State<GiveRideRecommendationScreen> createState() =>
      _GiveRideRecommendationScreenState();
}

class _GiveRideRecommendationScreenState
    extends State<GiveRideRecommendationScreen> {
  late GiveRideRecommendationBloc bloc;

  @override
  void initState() {
    bloc = GiveRideRecommendationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          bloc..onStart(context: context, giveRideId: widget.giveRideId),
      child:
          BlocListener<GiveRideRecommendationBloc, GiveRideRecommendationState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<GiveRideRecommendationBloc,
            GiveRideRecommendationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(title: 'Người cần đi nhờ đề xuất'),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        key: ObjectKey(state.dataChange),
                        children: [
                          _buildHitchRideRecommendationList(),
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

  Widget _buildHitchRideRecommendationList() {
    return BlocBuilder<GiveRideRecommendationBloc, GiveRideRecommendationState>(
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
            itemCount: state.hitchRideRecommendationList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => spaceH8,
            itemBuilder: (context, index) {
              final item = state.hitchRideRecommendationList[index];
              return InkWell(
                onTap: () =>
                    bloc.onSelectedHitcher(context: context, index: index),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.secondary200),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ListTile(
                    leading: Assets.images.exampleAvatar.image(),
                    title: Text(
                      item.user?.fullName ?? '',
                      style: textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      '${item.distance}km - ${item.duration} phút',
                      style: textTheme.bodyMedium!
                          .copyWith(color: AppColor.secondary400),
                    ),
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
