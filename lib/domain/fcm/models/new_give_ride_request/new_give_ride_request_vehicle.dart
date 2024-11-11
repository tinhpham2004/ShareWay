import 'package:json_annotation/json_annotation.dart';

part 'new_give_ride_request_vehicle.g.dart';

@JsonSerializable()
class NewGiveRideRequestVehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  NewGiveRideRequestVehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory NewGiveRideRequestVehicle.fromJson(Map<String, dynamic> json) {
    return _$NewGiveRideRequestVehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewGiveRideRequestVehicleToJson(this);
}
