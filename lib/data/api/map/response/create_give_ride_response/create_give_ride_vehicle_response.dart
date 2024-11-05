import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_vehicle_response.g.dart';

@JsonSerializable()
class CreateGiveRideVehicleResponse {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  CreateGiveRideVehicleResponse({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory CreateGiveRideVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRideVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRideVehicleResponseToJson(this);
}
