import 'package:json_annotation/json_annotation.dart';

part 'history_ride_vehicle_response.g.dart';

@JsonSerializable()
class HistoryRideVehicleResponse {
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;
  String? name;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  HistoryRideVehicleResponse({
    this.fuelConsumed,
    this.licensePlate,
    this.name,
    this.vehicleId,
  });

  factory HistoryRideVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$HistoryRideVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRideVehicleResponseToJson(this);
}
