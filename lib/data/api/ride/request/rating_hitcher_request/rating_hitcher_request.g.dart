// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_hitcher_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingHitcherRequest _$RatingHitcherRequestFromJson(
        Map<String, dynamic> json) =>
    RatingHitcherRequest(
      rating: (json['rating'] as num?)?.toInt(),
      receiverId: json['receiverID'] as String?,
      review: json['review'] as String?,
      rideId: json['rideID'] as String?,
    );

Map<String, dynamic> _$RatingHitcherRequestToJson(
        RatingHitcherRequest instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'receiverID': instance.receiverId,
      'review': instance.review,
      'rideID': instance.rideId,
    };
