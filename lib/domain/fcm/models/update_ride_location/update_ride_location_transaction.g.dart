// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ride_location_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRideLocationTransaction _$UpdateRideLocationTransactionFromJson(
        Map<String, dynamic> json) =>
    UpdateRideLocationTransaction(
      transactionId: json['transaction_id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$UpdateRideLocationTransactionToJson(
        UpdateRideLocationTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
    };
