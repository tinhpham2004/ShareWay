import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_state.dart';

class GiveRideRatingScreen extends StatefulWidget {
  const GiveRideRatingScreen({super.key});

  @override
  State<GiveRideRatingScreen> createState() => _GiveRideRatingScreenState();
}

class _GiveRideRatingScreenState extends State<GiveRideRatingScreen> {
  late GiveRideRatingBloc bloc;

  @override
  void initState() {
    bloc = GiveRideRatingBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      spaceH16,
                      Assets.images.defaultAvatar.image(),
                      spaceH4,
                      Text(
                        'Nguyễn Thanh Minh',
                        style: textTheme.titleMedium,
                      ),
                      spaceH4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Honda Vision',
                            style: textTheme.titleSmall!.copyWith(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          spaceW4,
                          Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          spaceW4,
                          Text(
                            'GR 678-UVWX',
                            style: textTheme.titleSmall!.copyWith(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
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
                          itemBuilder: (context, index) =>
                              Assets.icons.star.svg(
                            height: 40.h,
                            width: 40.w,
                            color: AppColor.secondary300,
                          ),
                          separatorBuilder: (context, index) => spaceW16,
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      spaceH8,
                      Divider(),
                    ],
                  ),
                ),
                _buildConfirmButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Column _buildConfirmButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Gửi đóng góp',
              isMargin: true,
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }
}
