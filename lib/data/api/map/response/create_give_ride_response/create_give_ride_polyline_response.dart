import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_polyline_response.g.dart';

@JsonSerializable()
class CreateGiveRidePolylineResponse {
  String? points;

  CreateGiveRidePolylineResponse({this.points});

  factory CreateGiveRidePolylineResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRidePolylineResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRidePolylineResponseToJson(this);
}
