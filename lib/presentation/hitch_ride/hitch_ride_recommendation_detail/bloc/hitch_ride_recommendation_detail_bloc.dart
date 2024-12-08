import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/cancel_ride_request/cancel_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/end_ride/end_ride_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_give_ride_request/new_give_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/start_ride/start_ride_data.dart';
import 'package:share_way_frontend/domain/fcm/models/update_ride_location/update_ride_location_data.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/ride/input/cancel_ride_input.dart';
import 'package:share_way_frontend/domain/ride/input/ride_request_input.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/web_socket/web_socket_repository.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/main.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_state.dart';
import 'package:share_way_frontend/router/app_path.dart';
import 'dart:ui' as ui;

class HitchRideRecommendationDetailBloc
    extends Cubit<HitchRideRecommendationDetailState> {
  late WebSocketRepository _webSocketRepository;
  final _rideRepository = RideRepository();

  HitchRideRecommendationDetailBloc()
      : super(HitchRideRecommendationDetailState()) {
    _webSocketRepository = WebSocketRepository(
      onStartRide: onStartRide,
      onUpdateRideLocation: onUpdateDriverLocation,
      onEndRide: onEndRide,
      onNewGiveRideRequest: onNewGiveRideRequest,
      onAcceptHitchRideRequest: onAcceptHitchRideRequest,
      onCancelHitchRideRequest: onCancelHitchRideRequest,
      onCancelGiveRideRequest: onCancelHitchRideRequest,
      onCancelRideByDriver: onCancelRideByDriver,
    );
    _webSocketRepository.connect();
  }

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

  void onPrimaryButton(BuildContext context) async {
    switch (state.giveRideRecommendationOuput?.status) {
      case RideStatusEnum.CREATED:
        onSendHitchRide(context);
        break;
      case RideStatusEnum.RECEIVING:
        onAcceptGiveRide(context);
        break;
      case RideStatusEnum.SENDING:
        onCancelHitchRide(context);
        break;
      case RideStatusEnum.ACCEPTED:
        onCancelRide(context);
        break;
      case RideStatusEnum.ONGOING:
        onCancelRide(context);
        break;
      case RideStatusEnum.COMPLETED:
        break;
      case RideStatusEnum.CANCELLED:
        break;
      default:
        break;
    }
  }

  void onSecondaryButton(BuildContext context) async {
    switch (state.giveRideRecommendationOuput?.status) {
      case RideStatusEnum.CREATED:
        break;
      case RideStatusEnum.RECEIVING:
        onCancelGiveRide(context);
        break;
      case RideStatusEnum.SENDING:
        break;
      case RideStatusEnum.ACCEPTED:
        break;
      case RideStatusEnum.ONGOING:
        break;
      case RideStatusEnum.COMPLETED:
        break;
      case RideStatusEnum.CANCELLED:
        break;
      default:
        break;
    }
  }

  void onSendHitchRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.giveRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.giveRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.giveRideRecommendationOuput?.vehicle?.vehicleId ?? '',
    );
    final response = await _rideRepository.sendHitchRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        giveRideRecommendationOuput:
            state.giveRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.SENDING,
        ),
      ));
      showSuccessSnackbar(context, 'Đã gửi yêu cầu thành công');
    }
  }

  void onAcceptGiveRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.giveRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.giveRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.giveRideRecommendationOuput?.vehicle?.vehicleId ?? '',
    );
    final response = await _rideRepository.acceptGiveRide(input);

    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        giveRideRecommendationOuput:
            state.giveRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.ACCEPTED,
          rideId: response,
        ),
      ));
      showSuccessSnackbar(context, 'Đã chấp nhận yêu cầu thành công');
    }
  }

  void onCancelHitchRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.giveRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.giveRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.giveRideRecommendationOuput?.vehicle?.vehicleId ?? '',
    );
    final response = await _rideRepository.cancelHitchRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        giveRideRecommendationOuput:
            state.giveRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CREATED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
    }
  }

  void onCancelGiveRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.giveRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.giveRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.giveRideRecommendationOuput?.vehicle?.vehicleId ?? '',
    );
    final response = await _rideRepository.cancelHitchRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        giveRideRecommendationOuput:
            state.giveRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CREATED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
    }
  }

  void onCancelRide(BuildContext context) async {
    final input = CancelRideInput(
      receiverId: state.giveRideRecommendationOuput?.user?.id ?? '',
      vehicleId: state.giveRideRecommendationOuput?.vehicle?.vehicleId ?? '',
      rideId: state.giveRideRecommendationOuput?.rideId ?? '',
    );
    final response = await _rideRepository.cancelRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        giveRideRecommendationOuput:
            state.giveRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CANCELLED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
      state.userPointAnnotationManager?.deleteAll();
    }
  }

  void onStartRide(StartRideData data) async {
    final userPointAnnotationManager =
        await state.mapboxMap?.annotations.createPointAnnotationManager();
    emit(
      state.copyWith(
        userPointAnnotationManager: userPointAnnotationManager,
        giveRideRecommendationOuput:
            GiveRideRecommendationOuput.fromStartRide(data).copyWith(
          user: state.giveRideRecommendationOuput?.user,
          status: RideStatusEnum.ONGOING,
        ),
      ),
    );
  }

  void onUpdateDriverLocation(UpdateRideLocationData data) {
    if (data.riderCurrentLatitude == null ||
        data.riderCurrentLongitude == null) {
      return;
    }
    state.userPointAnnotationManager?.deleteAll();
    emit(state.copyWith(
      driverLocation: Geocode(
        latitude: data.driverCurrentLatitude!,
        longitude: data.driverCurrentLongitude!,
      ),
      currentLocation: Geocode(
        latitude: data.riderCurrentLatitude!,
        longitude: data.riderCurrentLongitude!,
      ),
    ));
    updateLocationMarks();
  }

  void onEndRide(EndRideData data) {
    emit(
      state.copyWith(
        giveRideRecommendationOuput:
            GiveRideRecommendationOuput.fromEndRide(data).copyWith(
          user: state.giveRideRecommendationOuput?.user,
          status: RideStatusEnum.COMPLETED,
        ),
      ),
    );
    _webSocketRepository.dispose();
    state.userPointAnnotationManager?.deleteAll();
    navigatorKey.currentContext?.go(AppPath.hitchRideComplete, extra: state.giveRideRecommendationOuput);
  }

  void updateLocationMarks() async {
    try {
      final ByteData riderBytes =
          await rootBundle.load(Assets.images.realtimeCurrentLocationMark.path);
      final Uint8List driverImageData = riderBytes.buffer.asUint8List();

      final ByteData driverBytes = await getByteDataFromCachedNetworkImage(
              state.giveRideRecommendationOuput?.user?.avatarUrl ?? '') ??
          await rootBundle.load(Assets.images.defaultAvatar.path);
      final Uint8List riderImageData = driverBytes.buffer.asUint8List();

      PointAnnotationOptions riderAnnotationOptions = PointAnnotationOptions(
        geometry: Point(
            coordinates: Position(state.driverLocation!.longitude,
                state.driverLocation!.latitude)),
        image: driverImageData,
        iconSize: driverImageData.length <= 2420 ? 2.0 : 1.0,
      );
      state.userPointAnnotationManager?.create(riderAnnotationOptions);

      PointAnnotationOptions driverAnnotationOptions = PointAnnotationOptions(
        geometry: Point(
            coordinates: Position(state.currentLocation!.longitude,
                state.currentLocation!.latitude)),
        image: riderImageData,
        iconSize: riderImageData.length <= 2420 ? 2.0 : 1.0,
      );
      state.userPointAnnotationManager?.create(driverAnnotationOptions);
    } catch (e) {
      // Handle error
      print('Error updating location marks: $e');
    }
  }

  Future<ByteData?> getByteDataFromCachedNetworkImage(String imageUrl) async {
    try {
      final Completer<ui.Image> completer = Completer<ui.Image>();

      // Load the image using CachedNetworkImage
      final imageProvider = CachedNetworkImageProvider(imageUrl);

      // Resolve the image
      imageProvider.resolve(const ImageConfiguration()).addListener(
            ImageStreamListener(
              (ImageInfo info, bool _) {
                completer.complete(info.image);
              },
              onError: (Object error, StackTrace? stackTrace) {
                completer.completeError(error, stackTrace);
              },
            ),
          );

      // Wait for the image to be loaded
      final ui.Image image = await completer.future;

      // Convert the image to ByteData
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      return byteData;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void onNewGiveRideRequest(NewGiveRideRequestData data) {
    emit(state.copyWith(
      giveRideRecommendationOuput:
          GiveRideRecommendationOuput.fromNewGiveRideRequest(data).copyWith(
        status: RideStatusEnum.RECEIVING,
      ),
    ));
  }

  void onAcceptHitchRideRequest(AcceptRideRequestData data) {
    emit(state.copyWith(
      giveRideRecommendationOuput:
          GiveRideRecommendationOuput.fromAcceptRideRequest(data)
              .copyWith(status: RideStatusEnum.ACCEPTED),
    ));
  }

  void onCancelHitchRideRequest(CancelRideRequestData data) {
    emit(state.copyWith(
      giveRideRecommendationOuput: state.giveRideRecommendationOuput?.copyWith(
        status: RideStatusEnum.CREATED,
      ),
    ));
  }

  void onCancelRideByDriver(CancelRideRequestData data) {
    emit(state.copyWith(
      giveRideRecommendationOuput: state.giveRideRecommendationOuput?.copyWith(
        status: RideStatusEnum.CANCELLED,
      ),
    ));
  }

  void onSelectPaymentMethod(int index) {
    emit(state.copyWith(selectedPaymentMethod: index));
  }

  void onPaymentMethodPressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.paymentMethod, extra: this);
  }
}
