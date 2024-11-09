import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_complete/bloc/give_ride_complete_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_complete/bloc/give_ride_complete_state.dart';

class GiveRideCompleteScreen extends StatefulWidget {
  const GiveRideCompleteScreen({super.key});

  @override
  State<GiveRideCompleteScreen> createState() => _GiveRideCompleteScreenState();
}

class _GiveRideCompleteScreenState extends State<GiveRideCompleteScreen> {
  late GiveRideCompleteBloc bloc;

  @override
  void initState() {
    bloc = GiveRideCompleteBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocBuilder<GiveRideCompleteBloc, GiveRideCompleteState>(
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
                      AppIcon.giveRideComplete,
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
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }
}
