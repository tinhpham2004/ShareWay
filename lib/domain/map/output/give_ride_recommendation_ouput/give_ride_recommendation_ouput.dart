import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/core/utils/enums/gender_enum.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_give_riders_response/suggest_give_riders_ride_offer_response.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_offer_response.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_request_response.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/end_ride/end_ride_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_give_ride_request/new_give_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/start_ride/start_ride_data.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/domain/vehicle/output/get_vehicle_ouput.dart';
part 'give_ride_recommendation_ouput.g.dart';

@CopyWith()
class GiveRideRecommendationOuput {
  final String? giveRideId;
  final double? distance;
  final int? duration;
  final double? fare;
  final String? polyline;
  final Geocode? startLocation;
  final Geocode? endLocation;
  final DateTime? startTime;
  final DateTime? endTime;
  final AppUser? user;
  final GetVehicleOuput? vehicle;
  final String? hitchRideId;
  final String? rideId;
  final RideStatusEnum status;
  final List<String> waypoints;

  GiveRideRecommendationOuput({
    this.giveRideId,
    this.distance,
    this.duration,
    this.fare,
    this.polyline,
    this.startLocation,
    this.endLocation,
    this.startTime,
    this.endTime,
    this.user,
    this.vehicle,
    this.hitchRideId,
    this.rideId,
    this.status = RideStatusEnum.CREATED,
    this.waypoints = const [],
  });

  factory GiveRideRecommendationOuput.fromApiModel(
      SuggestGiveRidersRideOfferResponse response) {
    return GiveRideRecommendationOuput(
      giveRideId: response.rideOfferId,
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
      vehicle: GetVehicleOuput(
        vehicleId: response.vehicle?.vehicleId,
        name: response.vehicle?.name,
        fuelConsumed: response.vehicle?.fuelConsumed,
        licensePlate: response.vehicle?.licensePlate,
      ),
      fare: response.fare,
    );
  }

  factory GiveRideRecommendationOuput.fromNewGiveRideRequest(
      NewGiveRideRequestData data) {
    return GiveRideRecommendationOuput(
      hitchRideId: data.rideRequestId,
      giveRideId: data.rideOfferId,
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
      vehicle: GetVehicleOuput(
        vehicleId: data.vehicle?.vehicleId,
        name: data.vehicle?.name,
        fuelConsumed: data.vehicle?.fuelConsumed,
        licensePlate: data.vehicle?.licensePlate,
      ),
      fare: data.fare,
    );
  }

  factory GiveRideRecommendationOuput.fromAcceptRideRequest(
      AcceptRideRequestData data) {
    return GiveRideRecommendationOuput(
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
      vehicle: GetVehicleOuput(
        vehicleId: data.vehicle?.vehicleId,
        name: data.vehicle?.name,
        fuelConsumed: data.vehicle?.fuelConsumed,
        licensePlate: data.vehicle?.licensePlate,
      ),
      rideId: data.rideId,
      user: AppUser(
        id: data.user?.id,
        fullName: data.user?.fullName,
        phoneNumber: data.user?.phoneNumber,
        avatarUrl: data.user?.avatarUrl,
        gender: GenderEnum.fromString(data.user?.gender ?? ''),
      ),
      fare: data.fare,
    );
  }

  factory GiveRideRecommendationOuput.fromStartRide(StartRideData data) {
    return GiveRideRecommendationOuput(
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
      vehicle: GetVehicleOuput(
        vehicleId: data.vehicle?.vehicleId,
        name: data.vehicle?.name,
        fuelConsumed: data.vehicle?.fuelConsumed,
        licensePlate: data.vehicle?.licensePlate,
      ),
      rideId: data.rideId,
      fare: data.fare,
    );
  }

  factory GiveRideRecommendationOuput.fromEndRide(EndRideData data) {
    return GiveRideRecommendationOuput(
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
      vehicle: GetVehicleOuput(
        vehicleId: data.vehicle?.vehicleId,
        name: data.vehicle?.name,
        fuelConsumed: data.vehicle?.fuelConsumed,
        licensePlate: data.vehicle?.licensePlate,
      ),
      rideId: data.rideId,
      fare: data.fare,
    );
  }

  factory GiveRideRecommendationOuput.fromPendingRide(
      PendingRideOfferResponse response) {
    return GiveRideRecommendationOuput(
      giveRideId: response.rideOfferId,
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
      startTime: response.startTime,
      endTime: response.endTime,
      user: AppUser(
        id: response.user?.userId,
        fullName: response.user?.fullName,
        phoneNumber: response.user?.phoneNumber,
        avatarUrl: response.user?.avatarUrl,
        gender: GenderEnum.fromString(response.user?.gender ?? ''),
      ),
      vehicle: GetVehicleOuput(
        vehicleId: response.vehicle?.vehicleId,
        name: response.vehicle?.name,
        fuelConsumed: response.vehicle?.fuelConsumed,
        licensePlate: response.vehicle?.licensePlate,
      ),
      fare: response.fare,
      waypoints: [
        response.startAddress ?? '',
        ...response.waypoints?.map((e) => e.address ?? '').toList() ?? [],
        response.endAddress ?? '',
      ],
    );
  }
}
