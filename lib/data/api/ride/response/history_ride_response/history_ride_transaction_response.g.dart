// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideTransactionResponse _$HistoryRideTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryRideTransactionResponse(
      amount: (json['amount'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String?,
      status: json['status'] as String?,
      transactionId: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$HistoryRideTransactionResponseToJson(
        HistoryRideTransactionResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'transaction_id': instance.transactionId,
    };
