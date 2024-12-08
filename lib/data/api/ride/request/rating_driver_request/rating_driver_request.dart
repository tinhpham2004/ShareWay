import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/ride/input/rating_driver_input.dart';

part 'rating_driver_request.g.dart';

@JsonSerializable()
class RatingDriverRequest {
  int? rating;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  String? review;
  @JsonKey(name: 'ride_id')
  String? rideId;

  RatingDriverRequest({
    this.rating,
    this.receiverId,
    this.review,
    this.rideId,
  });

  factory RatingDriverRequest.fromJson(Map<String, dynamic> json) {
    return _$RatingDriverRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingDriverRequestToJson(this);

  factory RatingDriverRequest.toApiModel(RatingDriverInput input) {
    return RatingDriverRequest(
      rating: input.rating,
      receiverId: input.receiverId,
      review: input.review,
      rideId: input.rideId,
    );
  }
}
