// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideDataResponse _$HistoryRideDataResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryRideDataResponse(
      rideHistory: (json['ride_history'] as List<dynamic>?)
          ?.map((e) => RideHistoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryRideDataResponseToJson(
        HistoryRideDataResponse instance) =>
    <String, dynamic>{
      'ride_history': instance.rideHistory,
    };
