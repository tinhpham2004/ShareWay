import 'package:json_annotation/json_annotation.dart';

part 'history_ride_waypoint_response.g.dart';

@JsonSerializable()
class HistoryRideWaypointResponse {
  String? address;
  double? lattitude;
  double? longitude;
  int? order;
  @JsonKey(name: 'waypoint_id')
  String? waypointId;

  HistoryRideWaypointResponse({
    this.address,
    this.lattitude,
    this.longitude,
    this.order,
    this.waypointId,
  });

  factory HistoryRideWaypointResponse.fromJson(Map<String, dynamic> json) {
    return _$HistoryRideWaypointResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRideWaypointResponseToJson(this);
}
