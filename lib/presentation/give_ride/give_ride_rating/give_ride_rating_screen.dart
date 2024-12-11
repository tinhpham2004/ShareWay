import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/avatar/app_avatar.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_state.dart';

class GiveRideRatingScreen extends StatefulWidget {
  final HitchRideRecommendationOuput data;

  const GiveRideRatingScreen({super.key, required this.data});

  @override
  State<GiveRideRatingScreen> createState() => _GiveRideRatingScreenState();
}

class _GiveRideRatingScreenState extends State<GiveRideRatingScreen> {
  late GiveRideRatingBloc bloc;

  @override
  void initState() {
    bloc = GiveRideRatingBloc(data: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocListener<GiveRideRatingBloc, GiveRideRatingState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<GiveRideRatingBloc, GiveRideRatingState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(
                title: 'Đánh giá chuyến đi',
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          spaceH16,
                          AppAvatar(
                            avatarUrl: widget.data.user?.avatarUrl ?? '',
                            averageRating: widget.data.user?.averageRating ?? 0,
                          ),
                          spaceH4,
                          Text(
                            widget.data.user?.fullName ?? '',
                            style: textTheme.titleMedium,
                          ),
                          // spaceH4,
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       widget.data.vehicle?.name ?? '',
                          //       style: textTheme.titleSmall!.copyWith(
                          //         color: AppColor.secondaryColor,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     spaceW4,
                          //     Container(
                          //       padding: EdgeInsets.all(3.r),
                          //       decoration: const BoxDecoration(
                          //         color: AppColor.primaryColor,
                          //         shape: BoxShape.circle,
                          //       ),
                          //     ),
                          //     spaceW4,
                          //     Text(
                          //       widget.data.vehicle?.licensePlate ?? '',
                          //       style: textTheme.titleSmall!.copyWith(
                          //         color: AppColor.secondaryColor,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          spaceH16,
                          Divider(),
                          spaceH8,
                          Text(
                            'Đánh giá người cho đi nhờ',
                            style: textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: 0.1.sh,
                            child: ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => bloc.onChangeRating(index + 1),
                                child: Assets.icons.star.svg(
                                  height: 40.h,
                                  width: 40.w,
                                  color: (state.star ?? 0) >= (index + 1)
                                      ? AppColor.warning
                                      : AppColor.secondary300,
                                ),
                              ),
                              separatorBuilder: (context, index) => spaceW16,
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          spaceH8,
                          Divider(),
                          spaceH16,
                          Row(
                            children: [
                              spaceW16,
                              Text(
                                'Góp ý của bạn',
                                style: textTheme.titleSmall,
                              ),
                            ],
                          ),
                          spaceH16,
                          TextFieldInput(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            minLines: 4,
                            maxLines: 4,
                            hintText: 'Góp ý tại đây',
                            onChanged: (p0) => bloc.onChangeFeedback(p0),
                          )
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

  Widget _buildConfirmButton() {
    return BlocBuilder<GiveRideRatingBloc, GiveRideRatingState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                AppButton(
                  title: 'Gửi đóng góp',
                  isMargin: true,
                  isEnabled: state.star != null,
                  onPressed: () => bloc.onSendFeedback(context),
                ),
              ],
            ),
            spaceH12,
          ],
        );
      },
    );
  }
}
