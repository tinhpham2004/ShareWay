import 'package:json_annotation/json_annotation.dart';

import 'end_ride_data.dart';

part 'end_ride.g.dart';

@JsonSerializable()
class EndRide {
  String? type;
  EndRideData? data;

  EndRide({this.type, this.data});

  factory EndRide.fromJson(Map<String, dynamic> json) {
    return _$EndRideFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EndRideToJson(this);
}
