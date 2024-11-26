import 'package:json_annotation/json_annotation.dart';

import 'pending_ride_data_response.dart';

part 'pending_ride_response.g.dart';

@JsonSerializable()
class PendingRideResponse {
  bool? success;
  PendingRideDataResponse? data;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;

  PendingRideResponse({
    this.success,
    this.data,
    this.messageEn,
    this.messageVi,
  });

  factory PendingRideResponse.fromJson(Map<String, dynamic> json) {
    return _$PendingRideResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingRideResponseToJson(this);
}
