import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/core/utils/enums/gender_enum.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_hitch_riders_response/suggest_hitch_riders_ride_request_response.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_offer_response.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_request_response.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request_data.dart';
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
  final String? rideId;
  final RideStatusEnum status;
  final String? startAddress;
  final String? endAddress;

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
    this.rideId,
    this.status = RideStatusEnum.CREATED,
    this.startAddress,
    this.endAddress,
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
        avatarUrl: response.user?.avatarUrl,
        gender: GenderEnum.fromString(response.user?.gender ?? ''),
      ),
    );
  }

  factory HitchRideRecommendationOuput.fromNewHitchRideRequest(
      NewHitchRideRequestData data) {
    return HitchRideRecommendationOuput(
      giveRideId: data.rideOfferId,
      hitchRideId: data.rideRequestId,
      distance: data.distance,
      duration: (data.duration != null)
          ? data.duration! ~/ 60 + (data.duration! % 60 == 0 ? 0 : 1)
          : null,
      polyline: data.encodedPolyline,
      startLocation: Geocode(
        latitude: data.startLatitude ?? 0.0,
        longitude: data.startLongitude ?? 0.0,
      ),
      endLocation: Geocode(
        latitude: data.endLatitude ?? 0.0,
        longitude: data.endLongitude ?? 0.0,
      ),
      startTime: data.startTime,
      endTime: data.endTime,
      user: AppUser(
        id: data.user?.id,
        fullName: data.user?.fullName,
        phoneNumber: data.user?.phoneNumber,
        avatarUrl: data.user?.avatarUrl,
        gender: GenderEnum.fromString(data.user?.gender ?? ''),
      ),
      vehicleId: data.vehicle?.vehicleId,
    );
  }

  factory HitchRideRecommendationOuput.fromAcceptRideRequest(
      AcceptRideRequestData data) {
    return HitchRideRecommendationOuput(
      giveRideId: data.rideOfferId,
      hitchRideId: data.rideRequestId,
      distance: data.distance,
      duration: (data.duration != null)
          ? data.duration! ~/ 60 + (data.duration! % 60 == 0 ? 0 : 1)
          : null,
      polyline: data.encodedPolyline,
      startLocation: Geocode(
        latitude: data.startLatitude ?? 0.0,
        longitude: data.startLongitude ?? 0.0,
      ),
      endLocation: Geocode(
        latitude: data.endLatitude ?? 0.0,
        longitude: data.endLongitude ?? 0.0,
      ),
      startTime: data.startTime,
      endTime: data.endTime,
      vehicleId: data.vehicle?.vehicleId,
      rideId: data.rideId,
      user: AppUser(
        id: data.user?.id,
        fullName: data.user?.fullName,
        phoneNumber: data.user?.phoneNumber,
        avatarUrl: data.user?.avatarUrl,
        gender: GenderEnum.fromString(data.user?.gender ?? ''),
      ),
    );
  }

  factory HitchRideRecommendationOuput.fromPendingRide(
      PendingRideRequestResponse response) {
    return HitchRideRecommendationOuput(
      hitchRideId: response.rideRequestId,
      distance: response.distance?.toDouble(),
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
      startTime: DateTime.tryParse(response.startTime ?? ''),
      endTime: DateTime.tryParse(response.endTime ?? ''),
      user: AppUser(
        id: response.user?.userId,
        fullName: response.user?.fullName,
        phoneNumber: response.user?.phoneNumber,
        avatarUrl: response.user?.avatarUrl,
        gender: GenderEnum.fromString(response.user?.gender ?? ''),
      ),
      startAddress: response.startAddress,
      endAddress: response.endAddress,
    );
  }
}
