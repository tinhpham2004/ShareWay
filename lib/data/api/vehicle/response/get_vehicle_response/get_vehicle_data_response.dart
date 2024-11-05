import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/vehicle/response/get_vehicle_response/get_vehicle_item_response.dart';

part 'get_vehicle_data_response.g.dart';

@JsonSerializable()
class GetVehicleDataResponse {
  List<GetVehicleItemResponse>? vehicle;

  GetVehicleDataResponse({this.vehicle});

  factory GetVehicleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVehicleDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVehicleDataResponseToJson(this);
}
