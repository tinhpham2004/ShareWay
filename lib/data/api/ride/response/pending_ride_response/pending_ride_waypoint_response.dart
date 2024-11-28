import 'package:json_annotation/json_annotation.dart';

part 'pending_ride_waypoint_response.g.dart';

@JsonSerializable()
class PendingRideWaypointResponse {
  @JsonKey(name: 'waypoint_id')
  String? waypointId;
  double? lattitude;
  double? longitude;
  String? address;
  int? order;

  PendingRideWaypointResponse({
    this.waypointId,
    this.lattitude,
    this.longitude,
    this.address,
    this.order,
  });

  factory PendingRideWaypointResponse.fromJson(Map<String, dynamic> json) {
    return _$PendingRideWaypointResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingRideWaypointResponseToJson(this);
}
