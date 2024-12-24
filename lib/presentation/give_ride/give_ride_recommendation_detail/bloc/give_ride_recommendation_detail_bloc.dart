import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/cancel_ride_request/cancel_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request_data.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/ride/input/cancel_ride_input.dart';
import 'package:share_way_frontend/domain/ride/input/matched_ride_input.dart';
import 'package:share_way_frontend/domain/ride/input/ride_request_input.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/web_socket/web_socket_repository.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation_detail/bloc/give_ride_recommendation_detail_state.dart';
import 'package:share_way_frontend/router/app_path.dart';
import 'dart:ui' as ui;

class GiveRideRecommendationDetailBloc
    extends Cubit<GiveRideRecommendationDetailState> {
  final _rideRepository = RideRepository();
  late WebSocketRepository _webSocketRepository;

  GiveRideRecommendationDetailBloc()
      : super(GiveRideRecommendationDetailState()) {
    _webSocketRepository = WebSocketRepository(
      // onUpdateRideLocation: onUpdateRiderLocation,
      onNewHitchRideRequest: onNewHitchRideRequest,
      onAcceptGiveRideRequest: onAcceptGiveRideRequest,
      onCancelGiveRideRequest: onCancelRideRequest,
      onCancelHitchRideRequest: onCancelRideRequest,
    );
    _webSocketRepository.connect();
  }

  void onNewHitchRideRequest(NewHitchRideRequestData data) {
    emit(state.copyWith(
      hitchRideRecommendationOuput:
          HitchRideRecommendationOuput.fromNewHitchRideRequest(data)
              .copyWith(status: RideStatusEnum.RECEIVING),
    ));
  }

  void onAcceptGiveRideRequest(AcceptRideRequestData data) {
    emit(state.copyWith(
      hitchRideRecommendationOuput:
          HitchRideRecommendationOuput.fromAcceptRideRequest(data)
              .copyWith(status: RideStatusEnum.ACCEPTED),
    ));
  }

  void onCancelRideRequest(CancelRideRequestData data) {
    emit(state.copyWith(
      hitchRideRecommendationOuput: state.hitchRideRecommendationOuput
          ?.copyWith(status: RideStatusEnum.CREATED),
    ));
  }

  // void onUpdateRiderLocation(UpdateRideLocationData data) {
  //   if (data.riderCurrentLatitude == null ||
  //       data.riderCurrentLongitude == null) {
  //     return;
  //   }
  //   emit(state.copyWith(
  //     riderLocation: Geocode(
  //       latitude: data.riderCurrentLatitude!,
  //       longitude: data.riderCurrentLongitude!,
  //     ),
  //   ));
  // }

  void onStart(HitchRideRecommendationOuput data) {
    emit(state.copyWith(
      isLoading: true,
      hitchRideRecommendationOuput: data,
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
          .decodePolyline(state.hitchRideRecommendationOuput?.polyline ?? '');

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
        state.hitchRideRecommendationOuput?.startLocation,
        state.hitchRideRecommendationOuput?.endLocation
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
    switch (state.hitchRideRecommendationOuput?.status) {
      case RideStatusEnum.CREATED:
        onSendGiveRide(context);
        break;
      case RideStatusEnum.RECEIVING:
        onAcceptHitchRide(context);
        break;
      case RideStatusEnum.SENDING:
        onCancelGiveRide(context);
        break;
      case RideStatusEnum.ACCEPTED:
        onStartRide(context);
        break;
      case RideStatusEnum.ONGOING:
        onEndRide(context);
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
    switch (state.hitchRideRecommendationOuput?.status) {
      case RideStatusEnum.CREATED:
        break;
      case RideStatusEnum.RECEIVING:
        onCancelHitchRide(context);
        break;
      case RideStatusEnum.SENDING:
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

  void onSendGiveRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.hitchRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.hitchRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.hitchRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
    );
    final response = await _rideRepository.sendGiveRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.SENDING,
        ),
      ));
      showSuccessSnackbar(context, 'Đã gửi yêu cầu thành công');
    }
  }

  void onAcceptHitchRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.hitchRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.hitchRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.hitchRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
    );
    final response = await _rideRepository.acceptHitchRide(input);

    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.ACCEPTED,
          rideId: response,
        ),
      ));
      showSuccessSnackbar(context, 'Đã chấp nhận yêu cầu thành công');
    }
  }

  void onCancelGiveRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.hitchRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.hitchRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.hitchRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
    );
    final response = await _rideRepository.cancelGiveRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CREATED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
    }
  }

  void onCancelHitchRide(BuildContext context) async {
    final input = RideRequestInput(
      receiverId: state.hitchRideRecommendationOuput?.user?.id ?? '',
      giveRideId: state.hitchRideRecommendationOuput?.giveRideId ?? '',
      hitchRideId: state.hitchRideRecommendationOuput?.hitchRideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
    );
    final response = await _rideRepository.cancelHitchRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CREATED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
    }
  }

  void onCancelRide(BuildContext context) async {
    final input = CancelRideInput(
      receiverId: state.hitchRideRecommendationOuput?.user?.id ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
      rideId: state.hitchRideRecommendationOuput?.rideId ?? '',
    );
    final response = await _rideRepository.cancelRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.CANCELLED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã hủy chuyến thành công');
      state.userPointAnnotationManager?.deleteAll();
      Future.delayed(Duration(seconds: 3), (){
        GoRouter.of(context).go(AppPath.home);
      });
    }
  }

  void onStartRide(BuildContext context) async {
    final input = MatchedRideInput(
      rideId: state.hitchRideRecommendationOuput?.rideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
      currentLocation: state.currentLocation,
    );
    final response = await _rideRepository.startRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.ONGOING,
        ),
      ));
      showSuccessSnackbar(context, 'Đã bắt đầu chuyến đi');
      final userPointAnnotationManager =
          await state.mapboxMap?.annotations.createPointAnnotationManager();
      emit(state.copyWith(
          userPointAnnotationManager: userPointAnnotationManager));
      Timer.periodic(Duration(seconds: 3), (timer) {
        if (state.hitchRideRecommendationOuput?.status ==
            RideStatusEnum.ONGOING) {
          onUpdateCurrentLocation(context);
        } else {
          timer.cancel();
        }
      });
    }
  }

  void onUpdateCurrentLocation(BuildContext context) async {
    onUpdateLocation();
    final input = MatchedRideInput(
      rideId: state.hitchRideRecommendationOuput?.rideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
      currentLocation: state.currentLocation,
    );
    final response = await _rideRepository.updateRideLocation(input);
    updateLocationMarks();
    state.userPointAnnotationManager?.deleteAll();
  }

  void onEndRide(BuildContext context) async {
    final input = MatchedRideInput(
      rideId: state.hitchRideRecommendationOuput?.rideId ?? '',
      vehicleId: state.hitchRideRecommendationOuput?.vehicleId ?? '',
      currentLocation: state.currentLocation,
    );
    final response = await _rideRepository.endRide(input);

    if (response == false) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } else {
      emit(state.copyWith(
        hitchRideRecommendationOuput:
            state.hitchRideRecommendationOuput?.copyWith(
          status: RideStatusEnum.COMPLETED,
        ),
      ));
      showSuccessSnackbar(context, 'Đã kết thúc chuyến đi');
      _webSocketRepository.dispose();
      GoRouter.of(context).push(AppPath.giveRideComplete,
          extra: state.hitchRideRecommendationOuput);
    }
  }

  void onUpdateLocation() async {
    Location location = Location();
    final currentLocation = await location.getLocation();
    if (currentLocation.latitude != null && currentLocation.longitude != null) {
      final geocode = Geocode(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
      );
      emit(state.copyWith(currentLocation: geocode));
      await Preferences.saveCurrentLocation(geocode);
    }
  }

  void updateLocationMarks() async {
    try {
      // Load the images (you can do this once and store the image data)
      final ByteData driverBytes =
          await rootBundle.load(Assets.images.realtimeCurrentLocationMark.path);
      final Uint8List driverImageData = driverBytes.buffer.asUint8List();

      final ByteData riderBytes = await getByteDataFromCachedNetworkImage(
              state.hitchRideRecommendationOuput?.user?.avatarUrl ?? '') ??
          await rootBundle.load(Assets.images.defaultAvatar.path);

      final Uint8List riderImageData = riderBytes.buffer.asUint8List();

      // Update driver location
      PointAnnotationOptions driverAnnotationOptions = PointAnnotationOptions(
        geometry: Point(
            coordinates: Position(state.currentLocation!.longitude,
                state.currentLocation!.latitude)),
        image: driverImageData,
        iconSize: driverImageData.length <= 2420 ? 2.0 : 1.0,
      );
      state.userPointAnnotationManager?.create(driverAnnotationOptions);

      // Update rider location
      PointAnnotationOptions riderAnnotationOptions = PointAnnotationOptions(
        geometry: Point(
            coordinates: Position(state.currentLocation!.longitude,
                state.currentLocation!.latitude)),
        image: riderImageData,
        iconSize: riderImageData.length <= 2420 ? 2.0 : 1.0,
      );
      state.userPointAnnotationManager?.create(riderAnnotationOptions);
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

  void onChatPressed(BuildContext context) async {
    final chatRoomsBloc = ChatRoomsBloc();
    await chatRoomsBloc.onFetchChatRooms();
    final currentUserIndex = chatRoomsBloc.state.chatRooms.indexWhere(
      (element) =>
          element.receiver?.id == state.hitchRideRecommendationOuput?.user?.id,
    );
    chatRoomsBloc.onChangeSelectedChat(currentUserIndex);
    GoRouter.of(context).push(
      AppPath.chatDetail,
      extra: chatRoomsBloc,
    );
  }
}
