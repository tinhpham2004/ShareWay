import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

part 'give_ride_recommendation_detail_state.g.dart';

@CopyWith()
class GiveRideRecommendationDetailState {
  final bool isLoading;
  final MapboxMap? mapboxMap;
  final Geocode? currentLocation;
  final HitchRideRecommendationOuput? hitchRideRecommendationOuput;
  final List<List<double>> coordinates;
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

  GiveRideRecommendationDetailState({
    this.isLoading = false,
    this.mapboxMap,
    this.currentLocation,
    this.hitchRideRecommendationOuput,
    this.coordinates = const [],
    this.user,
  });
}
