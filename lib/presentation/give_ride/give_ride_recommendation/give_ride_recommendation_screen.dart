import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/avatar/app_avatar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/bloc/give_ride_recommendation_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/bloc/give_ride_recommendation_state.dart';

class GiveRideRecommendationScreen extends StatefulWidget {
  final CreateGiveRideOutput data;
  const GiveRideRecommendationScreen({super.key, required this.data});

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
          bloc..onStart(context: context, createGiveRideOutput: widget.data),
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
                          if (state.hitchRideRecommendationList.isEmpty) ...[
                            _buildEmptyResult()
                          ] else
                            _buildHitchRideRecommendationList(),
                        ],
                      ),
                    ),
                  ),
                  _buildReloadButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildReloadButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Tải lại',
              isMargin: true,
              onPressed: () => bloc.onFetchHitchRideRecommendationList(context),
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  Widget _buildEmptyResult() {
    return SizedBox(
      height: 0.8.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.noRideFound.image(),
          spaceH8,
          Text(
            'Không tìm thấy người cần đi nhờ phù hợp',
            style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          spaceH8,
          Text(
            'Vui lòng reload và chờ thêm vài phút',
            style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400, color: AppColor.secondaryColor),
            textAlign: TextAlign.center,
          ),
        ],
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
                    leading: AppAvatar(
                      avatarUrl: item.user?.avatarUrl ?? '',
                      averageRating: item.user?.averageRating ?? 0,
                    ),
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
