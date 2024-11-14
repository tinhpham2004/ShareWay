import 'package:json_annotation/json_annotation.dart';

part 'start_ride_vehicle.g.dart';

@JsonSerializable()
class StartRidevehicle {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  StartRidevehicle({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory StartRidevehicle.fromJson(Map<String, dynamic> json) {
    return _$StartRidevehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StartRidevehicleToJson(this);
}
