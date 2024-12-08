import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/image/app_image.dart';

import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_preview/bloc/give_ride_preview_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_preview/bloc/give_ride_preview_state.dart';

class GiveRidePreviewScreen extends StatefulWidget {
  final CreateGiveRideOutput data;

  GiveRidePreviewScreen({super.key, required this.data});

  @override
  State createState() => GiveRidePreviewScreenState();
}

class GiveRidePreviewScreenState extends State<GiveRidePreviewScreen> {
  late GiveRidePreviewBloc bloc;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  final ValueNotifier<bool> _isExpanded = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    bloc = GiveRidePreviewBloc();
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
      child: BlocBuilder<GiveRidePreviewBloc, GiveRidePreviewState>(
        builder: (context, state) {
          if (state.currentLocation == null) {
            return LoadingScreen();
          }
          return Scaffold(
              body: Stack(
            children: [
              mapbox.MapWidget(
                styleUri: mapbox.MapboxStyles.MAPBOX_STREETS,
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
                    if ((state.createGiveRideOutput?.locationList ?? [])
                        .isNotEmpty)
                      _showLocationListBottomSheet(),
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget _showLocationListBottomSheet() {
    return BlocBuilder<GiveRidePreviewBloc, GiveRidePreviewState>(
      builder: (context, state) {
        return AppBottomSheet(
          height: 0.5.sh,
          isExpanded: _isExpanded,
          draggableScrollableController: _draggableScrollableController,
          body: [
            Expanded(
              child: Column(
                children: [
                  _buildRideInfor(state),
                  _buildLocationList(state),
                ],
              ),
            ),
            _buildContinueButton(),
          ],
        );
      },
    );
  }

  Widget _buildRideInfor(GiveRidePreviewState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: AppAvatar(
            avatarUrl: state.user?.avatarUrl ?? '',
            averageRating: state.user?.averageRating ?? 0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  state.user?.fullName ?? '',
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  state.fareString,
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
                  '${state.createGiveRideOutput?.distance}km - ${state.durationString}',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${state.createGiveRideOutput?.vehicle}km',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        spaceH12,
      ],
    );
  }

  Widget _buildLocationList(GiveRidePreviewState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.createGiveRideOutput?.locationList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final location = state.createGiveRideOutput?.locationList[index];
          return Container(
            color: state.selectedLocationIndex == index
                ? AppColor.primary100
                : null,
            child: ListTile(
              title: Text(
                location?.mainAddress ?? '',
                style: textTheme.titleSmall,
              ),
              subtitle: Text(
                location?.secondaryAddress ?? '',
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColor.secondaryColor),
              ),
              leading: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: state.selectedLocationIndex == index
                          ? AppColor.primaryColor
                          : AppColor.primary100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on_rounded,
                      color: state.selectedLocationIndex == index
                          ? AppColor.white
                          : AppColor.primaryColor,
                    ),
                  ),
                  Text(
                    location?.distance ?? '',
                    style: textTheme.labelSmall!
                        .copyWith(color: AppColor.secondaryColor),
                  ),
                ],
              ),
              onTap: () =>
                  bloc.onSelectLocation(context: context, index: index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContinueButton() {
    return Column(
      children: [
        spaceH16,
        Row(
          children: [
            AppButton(
              title: 'Tiếp tục',
              onPressed: () => bloc.onContinue(context),
            ),
          ],
        ),
      ],
    );
  }
}
