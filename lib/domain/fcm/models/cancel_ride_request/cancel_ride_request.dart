import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/fcm/models/cancel_ride_request/cancel_ride_request_data.dart';

part 'cancel_ride_request.g.dart';

@JsonSerializable()
class CancelRideRequest {
  String? type;
  CancelRideRequestData? data;

  CancelRideRequest({this.type, this.data});

  factory CancelRideRequest.fromJson(Map<String, dynamic> json) {
    json['data'] = json['data'] != null ? jsonDecode(json['data']) : null;
    return _$CancelRideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CancelRideRequestToJson(this);
}
