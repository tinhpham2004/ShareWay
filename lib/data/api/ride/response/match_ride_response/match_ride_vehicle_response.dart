import 'package:json_annotation/json_annotation.dart';

part 'match_ride_vehicle_response.g.dart';

@JsonSerializable()
class MatchRideVehicleResponse {
  @JsonKey(name: 'fuel_consumed')
  int? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;
  String? name;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  MatchRideVehicleResponse({
    this.fuelConsumed,
    this.licensePlate,
    this.name,
    this.vehicleId,
  });

  factory MatchRideVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchRideVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchRideVehicleResponseToJson(this);
}
