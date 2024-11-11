import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'accept_ride_request_data.dart';

part 'accept_ride_request.g.dart';

@JsonSerializable()
class AcceptRideRequest {
  String? type;
  AcceptRideRequestData? data;

  AcceptRideRequest({this.type, this.data});

  factory AcceptRideRequest.fromJson(Map<String, dynamic> json) {
    json['data'] = json['data'] != null ? jsonDecode(json['data']) : null;
    return _$AcceptRideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptRideRequestToJson(this);
}
