import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_payment_method.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/date_time.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/avatar/app_avatar.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_bloc.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_state.dart';

class HitchRideRecommendationDetailScreen extends StatefulWidget {
  final GiveRideRecommendationOuput data;

  HitchRideRecommendationDetailScreen({super.key, required this.data});

  @override
  State createState() => HitchRideRecommendationDetailScreenState();
}

class HitchRideRecommendationDetailScreenState
    extends State<HitchRideRecommendationDetailScreen> {
  late HitchRideRecommendationDetailBloc bloc;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  final ValueNotifier<bool> _isExpanded = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    bloc = HitchRideRecommendationDetailBloc();
    _draggableScrollableController.addListener(() {
      _isExpanded.value = _draggableScrollableController.size > 0.15;
    });
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(widget.data),
      child: BlocBuilder<HitchRideRecommendationDetailBloc,
          HitchRideRecommendationDetailState>(
        builder: (context, state) {
          if (state.currentLocation == null) {
            return LoadingScreen();
          }
          return Scaffold(
              body: Stack(
            children: [
              MapWidget(
                styleUri: MapboxStyles.MAPBOX_STREETS,
                onMapCreated: bloc.onMapCreated,
                onStyleLoadedListener: bloc.onStyleLoadedCallback,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          flex: 0,
                          shape: BoxShape.circle,
                          icon: AppIcon.backToCurrentLocation,
                          backgroundColor: AppColor.white,
                          padding: EdgeInsets.all(8.w),
                          onPressed: () =>
                              bloc.onBackToCurrentLocation(context),
                        ),
                        spaceW8,
                      ],
                    ),
                    spaceH8,
                    _showHitcherDetailBottomSheet(),
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget _showHitcherDetailBottomSheet() {
    return BlocBuilder<HitchRideRecommendationDetailBloc,
        HitchRideRecommendationDetailState>(
      builder: (context, state) {
        return AppBottomSheet(
          height: 0.45.sh +
              state.giveRideRecommendationOuput!.status.getHitchRideDiffHeight,
          draggableScrollableController: _draggableScrollableController,
          isExpanded: _isExpanded,
          body: [
            Column(
              children: [
                spaceH8,
                Row(
                  children: [
                    spaceW16,
                    Text(
                      'Chi tiết về chuyến đi',
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    spaceW16,
                    Text(
                      'Vui lòng xem kỹ các thông tin về chuyến đi',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColor.secondaryColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                spaceH8,
                _buildDivider(),
                _buildRideInfor(state),
                _buildDivider(),
              ],
            ),
            _buildContinueButton(state),
          ],
        );
      },
    );
  }

  Row _buildDivider() {
    return Row(
      children: [
        spaceW16,
        const Expanded(child: Divider(color: AppColor.secondary100)),
        spaceW16,
      ],
    );
  }

  Widget _buildRideInfor(HitchRideRecommendationDetailState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: AppAvatar(
            avatarUrl: state.giveRideRecommendationOuput?.user?.avatarUrl ?? '',
            averageRating:
                state.giveRideRecommendationOuput?.user?.averageRating ?? 0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  state.giveRideRecommendationOuput?.user?.fullName ?? '',
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (state.giveRideRecommendationOuput?.status ==
                  RideStatusEnum.ACCEPTED)
                Row(
                  children: [
                    // AppIcon.rideCall,
                    // spaceW8,
                    InkWell(
                      onTap: () => bloc.onChatPressed(context),
                      child: AppIcon.rideChat,
                    ),
                  ],
                )
              else
                Flexible(
                  child: Text(
                    '${state.giveRideRecommendationOuput?.fare?.toString()}đ',
                    style: textTheme.titleSmall!.copyWith(
                      color: AppColor.primaryColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${state.giveRideRecommendationOuput?.distance}km - ${state.giveRideRecommendationOuput?.duration} phút',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (state.giveRideRecommendationOuput?.status !=
                  RideStatusEnum.ACCEPTED)
                Flexible(
                  child: Text(
                    '${state.giveRideRecommendationOuput?.vehicle?.name}',
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColor.secondaryColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (state.giveRideRecommendationOuput?.status ==
            RideStatusEnum.ACCEPTED)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Giá tiền',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColor.secondaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${state.giveRideRecommendationOuput?.fare?.toString()}đ',
                        style: textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        'Thông tin xe',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColor.secondaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${state.giveRideRecommendationOuput?.vehicle?.name}',
                        style: textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        _buildDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            spaceW16,
            InkWell(
              onTap: () {
                bloc.onPaymentMethodPressed(context);
              },
              child: Row(
                children: [
                  appPaymentMethods[state.selectedPaymentMethod].icon ?? space0,
                  spaceW4,
                  Text(
                    appPaymentMethods[state.selectedPaymentMethod].title ?? '',
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
              child: const VerticalDivider(
                color: AppColor.secondary100,
                width: 1,
              ),
            ),
            Row(
              children: [
                AppIcon.time,
                spaceW4,
                Text(
                  state.giveRideRecommendationOuput?.startTime
                          ?.format(pattern: dd_MM_yyyy_hh_mm) ??
                      '',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            spaceW16,
          ],
        ),
      ],
    );
  }

  Widget _buildContinueButton(HitchRideRecommendationDetailState state) {
    return Column(
      children: [
        if (state.giveRideRecommendationOuput?.status
                .getHitchRidePrimaryButtonTitle !=
            null)
          Row(
            children: [
              AppButton(
                title: state.giveRideRecommendationOuput?.status
                    .getHitchRidePrimaryButtonTitle,
                onPressed: () => bloc.onPrimaryButton(context),
                isMargin: true,
              ),
            ],
          ),
        if (state.giveRideRecommendationOuput?.status
                .getHitchRideSecondaryButtonTitle !=
            null) ...[
          spaceH12,
          Row(
            children: [
              AppButton(
                title: state.giveRideRecommendationOuput?.status
                    .getHitchRideSecondaryButtonTitle,
                backgroundColor: AppColor.primary100,
                textColor: AppColor.primaryColor,
                onPressed: () => bloc.onSecondaryButton(context),
                isMargin: true,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
