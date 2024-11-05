import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_overview_polyline_response.g.dart';

@JsonSerializable()
class CreateGiveRideOverviewPolylineResponse {
  String? points;

  CreateGiveRideOverviewPolylineResponse({this.points});

  factory CreateGiveRideOverviewPolylineResponse.fromJson(
      Map<String, dynamic> json) {
    return _$CreateGiveRideOverviewPolylineResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateGiveRideOverviewPolylineResponseToJson(this);
}
