import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/ride/input/ride_request_input.dart';

part 'ride_request.g.dart';

@JsonSerializable()
class RideRequest {
  @JsonKey(name: 'receiverID')
  String? receiverId;
  @JsonKey(name: 'rideOfferID')
  String? rideOfferId;
  @JsonKey(name: 'rideRequestID')
  String? rideRequestId;
  @JsonKey(name: 'vehicleID')
  String? vehicleId;

  RideRequest({
    this.receiverId,
    this.rideOfferId,
    this.rideRequestId,
    this.vehicleId,
  });

  factory RideRequest.fromJson(Map<String, dynamic> json) {
    return _$RideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RideRequestToJson(this);

  factory RideRequest.toApiModel(RideRequestInput input) {
    return RideRequest(
      receiverId: input.receiverId,
      rideOfferId: input.giveRideId,
      rideRequestId: input.hitchRideId,
      vehicleId: input.vehicleId,
    );
  }
}
