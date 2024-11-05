import 'package:json_annotation/json_annotation.dart';

import 'vehicle_data_response.dart';

part 'vehicles_response.g.dart';

@JsonSerializable()
class VehiclesResponse {
  bool? success;
  VehicleDataResponse? data;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;

  VehiclesResponse({
    this.success,
    this.data,
    this.messageEn,
    this.messageVi,
  });

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) {
    return _$VehiclesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VehiclesResponseToJson(this);
}
