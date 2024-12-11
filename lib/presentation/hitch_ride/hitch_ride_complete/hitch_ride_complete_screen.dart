import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_complete/bloc/hitch_ride_complete_bloc.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_complete/bloc/hitch_ride_complete_state.dart';

class HitchRideCompleteScreen extends StatefulWidget {
  final GiveRideRecommendationOuput data;

  const HitchRideCompleteScreen({super.key, required this.data});

  @override
  State<HitchRideCompleteScreen> createState() =>
      _HitchRideCompleteScreenState();
}

class _HitchRideCompleteScreenState extends State<HitchRideCompleteScreen> {
  late HitchRideCompleteBloc bloc;

  @override
  void initState() {
    bloc = HitchRideCompleteBloc(data: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocBuilder<HitchRideCompleteBloc, HitchRideCompleteState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: Appbar(
              title: '',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon.hitchRideComplete,
                      Text(
                        'Xin chúc mừng!',
                        style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Đã hoàn thành chuyến đi',
                        style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Chúc mừng bạn đã hoàn thành chuyến đi',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColor.secondaryColor,
                        ),
                      ),
                      Text(
                        'Bạn có thể xem lại lịch sử tại trang “Hoạt động"',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColor.secondaryColor,
                        ),
                      ),
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
              title: 'Đánh giá chuyến đi',
              onPressed: () => bloc.onFeedback(context),
              isMargin: true,
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }
}
