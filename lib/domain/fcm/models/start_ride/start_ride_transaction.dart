import 'package:json_annotation/json_annotation.dart';

part 'start_ride_transaction.g.dart';

@JsonSerializable()
class StartRideTransaction {
  @JsonKey(name: 'transaction_id')
  String? transactionId;
  double? amount;
  String? status;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  StartRideTransaction({
    this.transactionId,
    this.amount,
    this.status,
    this.paymentMethod,
  });

  factory StartRideTransaction.fromJson(Map<String, dynamic> json) {
    return _$StartRideTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StartRideTransactionToJson(this);
}
