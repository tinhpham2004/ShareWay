import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/ride/input/cancel_ride_input.dart';

part 'cancel_ride_request.g.dart';

@JsonSerializable()
class CancelRideRequest {
  @JsonKey(name: 'receiverID')
  String? receiverId;
  @JsonKey(name: 'rideID')
  String? rideId;
  @JsonKey(name: 'vehicleID')
  String? vehicleId;

  CancelRideRequest({this.receiverId, this.rideId, this.vehicleId});

  factory CancelRideRequest.fromJson(Map<String, dynamic> json) {
    return _$CancelRideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CancelRideRequestToJson(this);

  factory CancelRideRequest.toApiModel(CancelRideInput input) {
    return CancelRideRequest(
      receiverId: input.receiverId,
      rideId: input.rideId,
      vehicleId: input.vehicleId,
    );
  }
}
