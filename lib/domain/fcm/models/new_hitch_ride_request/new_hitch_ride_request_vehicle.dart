import 'package:json_annotation/json_annotation.dart';

part 'new_hitch_ride_request_vehicle.g.dart';

@JsonSerializable()
class NewHitchRideRequestVehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;

  @JsonKey(name: 'license_plate')
  String? licensePlate;

  NewHitchRideRequestVehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  /// Factory method for JSON deserialization
  factory NewHitchRideRequestVehicle.fromJson(Map<String, dynamic> json) =>
      _$NewHitchRideRequestVehicleFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$NewHitchRideRequestVehicleToJson(this);
}
