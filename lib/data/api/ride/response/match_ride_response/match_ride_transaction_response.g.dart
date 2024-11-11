// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_ride_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRideTransactionResponse _$MatchRideTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    MatchRideTransactionResponse(
      amount: (json['amount'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String?,
      status: json['status'] as String?,
      transactionId: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$MatchRideTransactionResponseToJson(
        MatchRideTransactionResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'transaction_id': instance.transactionId,
    };
