import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_routes_response.dart';

import 'create_give_ride_geocoded_waypoint_response.dart';

part 'create_give_ride_route_response.g.dart';

@JsonSerializable()
class CreateGiveRideRouteResponse {
  @JsonKey(name: 'geocoded_waypoints')
  List<CreateGiveRideGeocodedWaypointResponse>? geocodedWaypoints;
  @JsonKey(name: 'routes')
  List<CreateGiveRideRoutesResponse>? routes;

  CreateGiveRideRouteResponse({this.geocodedWaypoints, this.routes});

  factory CreateGiveRideRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGiveRideRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGiveRideRouteResponseToJson(this);
}
