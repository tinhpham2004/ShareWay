// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_hitcher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideHitcherResponse _$HistoryRideHitcherResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryRideHitcherResponse(
      avatarUrl: json['avatar_url'] as String?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      balanceInApp: (json['balance_in_app'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      gender: json['gender'] as String?,
      isMomoLinked: json['is_momo_linked'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$HistoryRideHitcherResponseToJson(
        HistoryRideHitcherResponse instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'average_rating': instance.averageRating,
      'balance_in_app': instance.balanceInApp,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'is_momo_linked': instance.isMomoLinked,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
    };
