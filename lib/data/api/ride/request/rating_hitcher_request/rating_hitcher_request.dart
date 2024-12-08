import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/ride/input/rating_hitcher_input.dart';

part 'rating_hitcher_request.g.dart';

@JsonSerializable()
class RatingHitcherRequest {
  int? rating;
  @JsonKey(name: 'receiverID')
  String? receiverId;
  String? review;
  @JsonKey(name: 'rideID')
  String? rideId;

  RatingHitcherRequest({
    this.rating,
    this.receiverId,
    this.review,
    this.rideId,
  });

  factory RatingHitcherRequest.fromJson(Map<String, dynamic> json) {
    return _$RatingHitcherRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingHitcherRequestToJson(this);

  factory RatingHitcherRequest.toApiModel(RatingHitcherInput input) {
    return RatingHitcherRequest(
      rating: input.rating,
      receiverId: input.receiverId,
      review: input.review,
      rideId: input.rideId,
    );
  }
}
