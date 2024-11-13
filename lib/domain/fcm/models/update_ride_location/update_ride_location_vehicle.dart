import 'package:json_annotation/json_annotation.dart';

part 'update_ride_location_vehicle.g.dart';

@JsonSerializable()
class UpdateRideLocationVehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  int? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  UpdateRideLocationVehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory UpdateRideLocationVehicle.fromJson(Map<String, dynamic> json) {
    return _$UpdateRideLocationVehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateRideLocationVehicleToJson(this);
}
