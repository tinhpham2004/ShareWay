import 'package:json_annotation/json_annotation.dart';

part 'pending_ride_vehicle_response.g.dart';

@JsonSerializable()
class PendingRideVehicleResponse {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  PendingRideVehicleResponse({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory PendingRideVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$PendingRideVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingRideVehicleResponseToJson(this);
}
