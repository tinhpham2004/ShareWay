import 'package:json_annotation/json_annotation.dart';

part 'vehicle_item_response.g.dart';

@JsonSerializable()
class VehicleItemResponse {
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  String? name;
  @JsonKey(name: 'fuel_consumed')
  double? fuelConsumed;

  VehicleItemResponse({this.vehicleId, this.name, this.fuelConsumed});

  factory VehicleItemResponse.fromJson(Map<String, dynamic> json) {
    return _$VehicleItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VehicleItemResponseToJson(this);
}
