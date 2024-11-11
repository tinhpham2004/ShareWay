// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ride_request_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRideRequestTransaction _$AcceptRideRequestTransactionFromJson(
        Map<String, dynamic> json) =>
    AcceptRideRequestTransaction(
      transactionId: json['transaction_id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$AcceptRideRequestTransactionToJson(
        AcceptRideRequestTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
    };
