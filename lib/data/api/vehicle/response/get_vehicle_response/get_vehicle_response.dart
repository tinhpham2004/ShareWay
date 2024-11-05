import 'package:json_annotation/json_annotation.dart';

import 'get_vehicle_data_response.dart';

part 'get_vehicle_response.g.dart';

@JsonSerializable()
class GetVehicleResponse {
  bool? success;
  GetVehicleDataResponse? data;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;

  GetVehicleResponse({
    this.success,
    this.data,
    this.messageEn,
    this.messageVi,
  });

  factory GetVehicleResponse.fromJson(Map<String, dynamic> json) {
    return _$GetVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetVehicleResponseToJson(this);
}
