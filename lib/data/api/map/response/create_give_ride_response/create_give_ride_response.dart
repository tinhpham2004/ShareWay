import 'package:json_annotation/json_annotation.dart';

import 'create_give_ride_data_response.dart';

part 'create_give_ride_response.g.dart';

@JsonSerializable()
class CreateGiveRideResponse {
  bool? success;
  CreateGiveRideDataResponse? data;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;

  CreateGiveRideResponse({
    this.success,
    this.data,
    this.messageEn,
    this.messageVi,
  });

  factory CreateGiveRideResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRideResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRideResponseToJson(this);
}
