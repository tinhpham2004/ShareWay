// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_ride_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartRideTransaction _$StartRideTransactionFromJson(
        Map<String, dynamic> json) =>
    StartRideTransaction(
      transactionId: json['transaction_id'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$StartRideTransactionToJson(
        StartRideTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
    };
