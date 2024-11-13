import 'package:json_annotation/json_annotation.dart';

import 'update_ride_location_data.dart';

part 'update_ride_location.g.dart';

@JsonSerializable()
class UpdateRideLocation {
  String? type;
  UpdateRideLocationData? data;

  UpdateRideLocation({this.type, this.data});

  factory UpdateRideLocation.fromJson(Map<String, dynamic> json) {
    return _$UpdateRideLocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateRideLocationToJson(this);
}
