import 'package:json_annotation/json_annotation.dart';

import 'match_ride_data_response.dart';

part 'match_ride_response.g.dart';

@JsonSerializable()
class MatchRideResponse {
  MatchRideDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  MatchRideResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory MatchRideResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchRideResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchRideResponseToJson(this);
}
