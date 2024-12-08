// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_driver_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDriverRequest _$RatingDriverRequestFromJson(Map<String, dynamic> json) =>
    RatingDriverRequest(
      rating: (json['rating'] as num?)?.toInt(),
      receiverId: json['receiver_id'] as String?,
      review: json['review'] as String?,
      rideId: json['ride_id'] as String?,
    );

Map<String, dynamic> _$RatingDriverRequestToJson(
        RatingDriverRequest instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'receiver_id': instance.receiverId,
      'review': instance.review,
      'ride_id': instance.rideId,
    };
