import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'new_give_ride_request_data.dart';

part 'new_give_ride_request.g.dart';

@JsonSerializable()
class NewGiveRideRequest {
  String? type;
  NewGiveRideRequestData? data;

  NewGiveRideRequest({this.type, this.data});

  factory NewGiveRideRequest.fromJson(Map<String, dynamic> json) {
    json['data'] = json['data'] != null ? jsonDecode(json['data']) : null;
    return _$NewGiveRideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewGiveRideRequestToJson(this);
}
