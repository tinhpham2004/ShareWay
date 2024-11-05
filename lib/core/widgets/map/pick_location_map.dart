import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/output/geocode/geocode_output.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

class PickLocationMap extends StatefulWidget {
  final Future<List<GeocodeOutput>?> Function(double lng, double lat)?
      onChangeLocation;
  final void Function(OptionItem)? onConfirmLocation;
  PickLocationMap({
    super.key,
    this.onChangeLocation,
    this.onConfirmLocation,
  });

  @override
  State<PickLocationMap> createState() => _PickLocationMapState();
}

class _PickLocationMapState extends State<PickLocationMap> {
  MapboxMap? mapboxMap;
  Timer? _debounce;
  List<GeocodeOutput> locationList = [];
  GeocodeOutput? selectedLocation;
  Geocode? currentLocation;

  @override
  void initState() {
    _onGetCurrentLocation();
    super.initState();
  }

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
  }

  Future<void> _onGetCurrentLocation() async {
    final currentLocation = await Preferences.getCurrentLocation();
    if (currentLocation?.latitude != null &&
        currentLocation?.longitude != null) {
      this.currentLocation = currentLocation;
      if (widget.onChangeLocation != null) {
        locationList = await widget.onChangeLocation!(
                currentLocation!.longitude.toDouble(),
                currentLocation.latitude.toDouble()) ??
            [];
      }

      setState(() {});
    }
  }

  Future<void> _moveToLocation(double longitude, double latitude) async {
    await mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(longitude, latitude),
        ),
        zoom: 15.0,
      ),
    );
  }

  // final pointAnnotationManager =
  //     await mapboxMap!.annotations.createPointAnnotationManager();
  // final ByteData bytes =
  //     await rootBundle.load(Assets.images.currentLocationMark.path);
  // final Uint8List list = bytes.buffer.asUint8List();

  // var options = PointAnnotationOptions(
  //   geometry: Point(
  //     coordinates: Position(longitude, latitude),
  //   ),
  //   image: list,
  //   iconSize: 2.0,
  // );

  // pointAnnotationManager.create(options);

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) return LoadingScreen();
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            onMapCreated: _onMapCreated,
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
                center: Point(
                    coordinates: Position(currentLocation!.longitude!,
                        currentLocation!.latitude!)),
                zoom: 15.0),
            onScrollListener: widget.onChangeLocation != null
                ? (scrollEventData) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(seconds: 1), () {
                      mapboxMap?.getCameraState().then((cameraState) async {
                        final center = cameraState.center;
                        final longitude = center.coordinates.lng;
                        final latitude = center.coordinates.lat;
                        locationList = await widget.onChangeLocation!(
                                longitude.toDouble(), latitude.toDouble()) ??
                            [];
                        setState(() {});
                      });
                    });
                  }
                : null,
          ),
          Positioned(
            top: 16.h,
            left: 16.w,
            child: Row(
              children: [
                AppButton(
                  flex: 0,
                  shape: BoxShape.circle,
                  icon: AppIcon.arrowLeft,
                  backgroundColor: AppColor.white,
                  padding: EdgeInsets.all(8.w),
                  onPressed: () => GoRouter.of(context).pop(),
                ),
              ],
            ),
          ),
          Center(
            child: Assets.icons.currentLocationMark.svg(),
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
                      onPressed: () {
                        _onGetCurrentLocation();
                      },
                    ),
                    spaceW8,
                  ],
                ),
                spaceH8,
                if (locationList.isNotEmpty) _showLocationListBottomSheet(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showLocationListBottomSheet() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.c_403A3A3A,
            offset: Offset(4.w, 4.h),
            blurRadius: 70.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spaceH12,
          const Row(
            children: [
              Spacer(),
              Expanded(
                child: Divider(
                  color: AppColor.secondary300,
                  thickness: 5,
                ),
              ),
              Spacer(),
            ],
          ),
          spaceH24,
          SizedBox(
            height: 0.2.sh,
            child: ListView.builder(
              itemCount: locationList.length,
              itemBuilder: (context, index) {
                final location = locationList[index];
                return Container(
                  color:
                      selectedLocation == location ? AppColor.primary100 : null,
                  child: ListTile(
                    title: Text(
                      location.mainAddress ?? '',
                      style: textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      location.secondaryAddress ?? '',
                      style: textTheme.bodyMedium!
                          .copyWith(color: AppColor.secondaryColor),
                    ),
                    leading: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: selectedLocation == location
                                ? AppColor.primaryColor
                                : AppColor.primary100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_on_rounded,
                            color: selectedLocation == location
                                ? AppColor.white
                                : AppColor.primaryColor,
                          ),
                        ),
                        Text('${location.distance} km',
                            style: textTheme.labelSmall!
                                .copyWith(color: AppColor.secondaryColor)),
                      ],
                    ),
                    onTap: () async {
                      setState(() {
                        selectedLocation = location;
                      });
                      _moveToLocation(location.longitude!, location.latitude!);
                    },
                  ),
                );
              },
            ),
          ),
          spaceH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                title: 'Xác nhận điểm đón',
                isEnabled: selectedLocation != null,
                onPressed: widget.onConfirmLocation != null
                    ? () {
                        widget.onConfirmLocation!.call(OptionItem(
                          idString: selectedLocation!.placeId,
                          name: selectedLocation!.description,
                        ));
                        GoRouter.of(context).pop();
                      }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
