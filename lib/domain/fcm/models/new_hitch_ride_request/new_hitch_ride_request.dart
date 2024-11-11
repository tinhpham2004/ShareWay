import 'dart:convert';

import 'new_hitch_ride_request_data.dart';

import 'package:json_annotation/json_annotation.dart';

part 'new_hitch_ride_request.g.dart';

@JsonSerializable()
class NewHitchRideRequest {
  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'data')
  NewHitchRideRequestData? data;

  NewHitchRideRequest({this.type, this.data});

  /// Factory method for JSON deserialization with nested JSON decoding
  factory NewHitchRideRequest.fromJson(Map<String, dynamic> json) {
    json['data'] = json['data'] != null ? jsonDecode(json['data']) : null;
    return _$NewHitchRideRequestFromJson(json);
  }

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$NewHitchRideRequestToJson(this);
}
