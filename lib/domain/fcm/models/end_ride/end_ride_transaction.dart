import 'package:json_annotation/json_annotation.dart';

part 'end_ride_transaction.g.dart';

@JsonSerializable()
class EndRideTransaction {
  @JsonKey(name: 'transaction_id')
  String? transactionId;
  double? amount;
  String? status;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  EndRideTransaction({
    this.transactionId,
    this.amount,
    this.status,
    this.paymentMethod,
  });

  factory EndRideTransaction.fromJson(Map<String, dynamic> json) {
    return _$EndRideTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EndRideTransactionToJson(this);
}
