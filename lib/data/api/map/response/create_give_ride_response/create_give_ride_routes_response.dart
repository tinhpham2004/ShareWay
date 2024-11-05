import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_leg_response.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_polyline_response.dart';

part 'create_give_ride_routes_response.g.dart';

@JsonSerializable()
class CreateGiveRideRoutesResponse {
  @JsonKey(name: 'legs')
  List<CreateGiveRideLegResponse>? legs;
  @JsonKey(name: 'overview_polyline')
  CreateGiveRidePolylineResponse? overviewPolyline;
  String? summary;

  CreateGiveRideRoutesResponse({
    this.legs,
    this.overviewPolyline,
    this.summary,
  });

  factory CreateGiveRideRoutesResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRideRoutesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRideRoutesResponseToJson(this);
}
