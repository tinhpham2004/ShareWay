// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_ride_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndRideTransaction _$EndRideTransactionFromJson(Map<String, dynamic> json) =>
    EndRideTransaction(
      transactionId: json['transaction_id'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$EndRideTransactionToJson(EndRideTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
    };
