import 'package:share_way_frontend/domain/shared/models/geocode.dart';

class MatchedRideInput {
  final String? rideId;
  final String? vehicleId;
  final Geocode? currentLocation;

  MatchedRideInput({
    this.rideId,
    this.vehicleId,
    this.currentLocation,
  });
}
