import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_hitch_riders_response/suggest_hitch_riders_ride_request_response.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
part 'hitch_ride_recommendation_ouput.g.dart';

@CopyWith()
class HitchRideRecommendationOuput {
  final String? hitchRideId;
  final double? distance;
  final int? duration;
  final String? polyline;
  final Geocode? startLocation;
  final Geocode? endLocation;
  final DateTime? startTime;
  final DateTime? endTime;
  final AppUser? user;
  final String? giveRideId;
  final String? vehicleId;

  HitchRideRecommendationOuput({
    this.hitchRideId,
    this.distance,
    this.duration,
    this.polyline,
    this.startLocation,
    this.endLocation,
    this.startTime,
    this.endTime,
    this.user,
    this.giveRideId,
    this.vehicleId,
  });

  factory HitchRideRecommendationOuput.fromApiModel(
      SuggestHitchRidersRideRequestResponse response) {
    return HitchRideRecommendationOuput(
      hitchRideId: response.rideRequestId,
      distance: response.distance,
      duration: (response.duration != null)
          ? response.duration! ~/ 60 + (response.duration! % 60 == 0 ? 0 : 1)
          : null,
      polyline: response.encodedPolyline,
      startLocation: Geocode(
        latitude: response.startLatitude ?? 0.0,
        longitude: response.startLongitude ?? 0.0,
      ),
      endLocation: Geocode(
        latitude: response.endLatitude ?? 0.0,
        longitude: response.endLongitude ?? 0.0,
      ),
      startTime: response.startTime,
      endTime: response.endTime,
      user: AppUser(
        id: response.user?.userId,
        fullName: response.user?.fullName,
        phoneNumber: response.user?.phoneNumber,
      ),
    );
  }
}
