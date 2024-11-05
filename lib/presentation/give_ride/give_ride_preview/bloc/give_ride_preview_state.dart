import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

part 'give_ride_preview_state.g.dart';

@CopyWith()
class GiveRidePreviewState {
  final bool isLoading;
  final MapboxMap? mapboxMap;
  final Geocode? currentLocation;
  final CreateGiveRideOutput? createGiveRideOutput;
  final int selectedLocationIndex;
  final List<List<double>> coordinates;
  String get durationString {
    final duration = createGiveRideOutput?.duration ?? 0;
    final minutes = duration ~/ 60;
    final extraMinute = (duration % 60 == 0) ? 0 : 1;
    return '${minutes + extraMinute} phút';
  }

  String get fareString {
    final fare = createGiveRideOutput?.fare.toString() ?? '0';
    final formattedFare = fare.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return '$formattedFaređ';
  }

  final AppUser? user;
  Map<String, Object> get geoJsonData => {
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "id": "featureID",
            "properties": {},
            "geometry": {"type": "LineString", "coordinates": coordinates}
          }
        ]
      };

  GiveRidePreviewState({
    this.isLoading = false,
    this.mapboxMap,
    this.currentLocation,
    this.createGiveRideOutput,
    this.coordinates = const [],
    this.selectedLocationIndex = 0,
    this.user,
  });
}
