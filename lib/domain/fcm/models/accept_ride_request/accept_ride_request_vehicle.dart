import 'package:json_annotation/json_annotation.dart';

part 'accept_ride_request_vehicle.g.dart';

@JsonSerializable()
class AcceptRideRequestVehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  int? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  AcceptRideRequestVehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory AcceptRideRequestVehicle.fromJson(Map<String, dynamic> json) {
    return _$AcceptRideRequestVehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptRideRequestVehicleToJson(this);
}
