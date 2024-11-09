import 'package:json_annotation/json_annotation.dart';

part 'suggest_give_riders_vehicle_response.g.dart';

@JsonSerializable()
class SuggestGiveRidersVehicleResponse {
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;
  String? name;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  SuggestGiveRidersVehicleResponse({
    this.fuelConsumed,
    this.licensePlate,
    this.name,
    this.vehicleId,
  });

  factory SuggestGiveRidersVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$SuggestGiveRidersVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SuggestGiveRidersVehicleResponseToJson(this);
}
