import 'package:json_annotation/json_annotation.dart';

part 'get_vehicle_item_response.g.dart';

@JsonSerializable()
class GetVehicleItemResponse {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;
  @JsonKey(name: 'license_plate')
  String? licensePlate;

  GetVehicleItemResponse({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory GetVehicleItemResponse.fromJson(Map<String, dynamic> json) {
    return _$GetVehicleItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetVehicleItemResponseToJson(this);
}
