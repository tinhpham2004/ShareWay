import 'package:json_annotation/json_annotation.dart';

part 'end_ride_vehicle.g.dart';

@JsonSerializable()
class EndRideVehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  EndRideVehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory EndRideVehicle.fromJson(Map<String, dynamic> json) {
    return _$EndRideVehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EndRideVehicleToJson(this);
}
