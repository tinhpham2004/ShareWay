import 'package:json_annotation/json_annotation.dart';

part 'cancel_ride_request_data.g.dart';

@JsonSerializable()
class CancelRideRequestData {
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  @JsonKey(name: 'user_id')
  String? userId;

  CancelRideRequestData({this.rideOfferId, this.rideRequestId, this.userId});

  factory CancelRideRequestData.fromJson(Map<String, dynamic> json) =>
      _$CancelRideRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$CancelRideRequestDataToJson(this);
}
