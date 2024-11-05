import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_distance_response.g.dart';

@JsonSerializable()
class CreateGiveRideDistanceResponse {
  String? text;
  int? value;

  CreateGiveRideDistanceResponse({this.text, this.value});

  factory CreateGiveRideDistanceResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRideDistanceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRideDistanceResponseToJson(this);
}
