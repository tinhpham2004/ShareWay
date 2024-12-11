import 'package:json_annotation/json_annotation.dart';

import 'ride_history_response.dart';

part 'history_ride_data_response.g.dart';

@JsonSerializable()
class HistoryRideDataResponse {
  @JsonKey(name: 'ride_history')
  List<RideHistoryResponse>? rideHistory;

  HistoryRideDataResponse({this.rideHistory});

  factory HistoryRideDataResponse.fromJson(Map<String, dynamic> json) => _$HistoryRideDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryRideDataResponseToJson(this);
}
