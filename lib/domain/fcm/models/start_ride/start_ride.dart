import 'package:json_annotation/json_annotation.dart';

import 'start_ride_data.dart';

part 'start_ride.g.dart';

@JsonSerializable()
class StartRide {
  String? type;
  StartRideData? data;

  StartRide({this.type, this.data});

  factory StartRide.fromJson(Map<String, dynamic> json) {
    return _$StartRideFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StartRideToJson(this);
}
