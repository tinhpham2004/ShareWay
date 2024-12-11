import 'package:json_annotation/json_annotation.dart';

import 'history_ride_data_response.dart';

part 'history_ride_response.g.dart';

@JsonSerializable()
class HistoryRideResponse {
  HistoryRideDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  HistoryRideResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory HistoryRideResponse.fromJson(Map<String, dynamic> json) {
    return _$HistoryRideResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRideResponseToJson(this);
}
