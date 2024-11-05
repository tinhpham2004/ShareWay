import 'package:json_annotation/json_annotation.dart';

import 'vehicle_item_response.dart';

part 'vehicle_data_response.g.dart';

@JsonSerializable()
class VehicleDataResponse {
  List<VehicleItemResponse>? vehicles;

  VehicleDataResponse({this.vehicles});

  factory VehicleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDataResponseToJson(this);
}
