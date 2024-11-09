import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/ride/input/ride_request_input.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_state.dart';

class HitchRideRecommendationDetailBloc
    extends Cubit<HitchRideRecommendationDetailState> {
  HitchRideRecommendationDetailBloc()
      : super(HitchRideRecommendationDetailState());

  final _rideRepository = RideRepository();

  void onStart(GiveRideRecommendationOuput data) {
    emit(state.copyWith(
      isLoading: true,
      giveRideRecommendationOuput: data,
    ));
    try {
      onGetCurrentLocation();
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _handleWebSocketEvent(Map<String, dynamic> event) {
    // Xử lý event từ WebSocket
    print('This is event: $event');
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onMapCreated(MapboxMap mapboxMap) async {
    emit(state.copyWith(mapboxMap: mapboxMap));
  }

  Future<void> onGetCurrentLocation() async {
    final currentLocation = await Preferences.getCurrentLocation();
    emit(state.copyWith(currentLocation: currentLocation));
  }

  void onStyleLoadedCallback(StyleLoadedEventData data) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      List<PointLatLng> decodedPolyline = polylinePoints
          .decodePolyline(state.giveRideRecommendationOuput?.polyline ?? '');

      List<List<double>> coordinates = decodedPolyline
          .map((point) => [point.longitude, point.latitude])
          .toList();

      emit(state.copyWith(coordinates: coordinates));

      CoordinateBounds bounds = CoordinateBounds(
          southwest: coordinates
              .map((coord) => Point(coordinates: Position(coord[0], coord[1])))
              .reduce((value, element) => Point(
                  coordinates: Position(
                      min(value.coordinates.lng, element.coordinates.lng),
                      min(value.coordinates.lat, element.coordinates.lat)))),
          northeast: coordinates
              .map((coord) => Point(coordinates: Position(coord[0], coord[1])))
              .reduce((value, element) => Point(
                  coordinates: Position(
                      max(value.coordinates.lng, element.coordinates.lng),
                      max(value.coordinates.lat, element.coordinates.lat)))),
          infiniteBounds: false);

      CameraOptions cameraOptions =
          await state.mapboxMap!.cameraForCoordinateBounds(
        bounds,
        MbxEdgeInsets(top: 50, left: 50, bottom: 50, right: 50),
        null,
        null,
        null,
        null,
      );

      state.mapboxMap!.setCamera(cameraOptions);

      final geoJsonData = jsonEncode(state.geoJsonData);

      await state.mapboxMap!.style
          .addSource(GeoJsonSource(id: "line", data: geoJsonData));
      await state.mapboxMap!.style.addLayer(
        LineLayer(
          id: "line_layer",
          sourceId: "line",
          lineJoin: LineJoin.ROUND,
          lineCap: LineCap.ROUND,
          lineColor: AppColor.secondaryColor.value,
          lineWidth: 6.0,
        ),
      );

      var newFeature = Feature(
          id: "featureID",
          geometry: LineString(
              coordinates: coordinates
                  .map((coord) => Position(coord[0], coord[1]))
                  .toList()));
      await state.mapboxMap!.style.updateGeoJSONSourceFeatures(
        "line",
        "new_line",
        [newFeature],
      );

      final pointAnnotationManager =
          await state.mapboxMap?.annotations.createPointAnnotationManager();

      // Load the image from assets
      final ByteData startBytes =
          await rootBundle.load(Assets.images.currentLocationMark.path);
      final Uint8List startImageData = startBytes.buffer.asUint8List();
      final ByteData endBytes =
          await rootBundle.load(Assets.images.endLocationMark.path);
      final Uint8List endImageData = endBytes.buffer.asUint8List();

      final geocodes = [
        state.giveRideRecommendationOuput?.startLocation,
        state.giveRideRecommendationOuput?.endLocation
      ];
      PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
          geometry: Point(
              coordinates: Position(
                  geocodes.first!.longitude, geocodes.first!.latitude)),
          image: startImageData,
          iconSize: 2.0 // Adjust size as needed
          );

      // Add the annotation to the map
      pointAnnotationManager?.create(pointAnnotationOptions);

      pointAnnotationOptions = PointAnnotationOptions(
          geometry: Point(
              coordinates:
                  Position(geocodes.last!.longitude, geocodes.last!.latitude)),
          image: endImageData,
          iconSize: 2.0 // Adjust size as needed
          );

      // Add the annotation to the map
      pointAnnotationManager?.create(pointAnnotationOptions);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> moveToLocation(
      {required BuildContext context, required Geocode location}) async {
    await state.mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(
            location.longitude,
            location.latitude,
          ),
        ),
        zoom: 15.0,
      ),
    );
  }

  void onBackToCurrentLocation(BuildContext context) async {
    final currentLocation = await Preferences.getCurrentLocation();
    if (currentLocation?.longitude == null ||
        currentLocation?.latitude == null) {
      showErrorSnackbar(context, 'Vị trí hiện tại không hợp lệ');
      return;
    }
    moveToLocation(
      context: context,
      location: currentLocation!,
    );
  }

  void onSendHitchRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id,
      giveRideId: state.giveRideRecommendationOuput?.giveRideId,
      hitchRideId: state.giveRideRecommendationOuput?.hitchRideId,
    );
    final response = await _rideRepository.sendHitchRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      showSuccessSnackbar(context, 'Đã gửi yêu cầu thành công');
    }
  }

  // void onContinue(BuildContext context) async {
  //   if (state.giveRideRecommendationOuput?.giveRideId == null) {
  //     showErrorSnackbar(context, 'Đã có lỗi xảy ra');
  //     return;
  //   }

  //   GoRouter.of(context).push(
  //     AppPath.giveRideRecommendation,
  //     extra: state.giveRideRecommendationOuput?.giveRideId,
  //   );
  // }
}