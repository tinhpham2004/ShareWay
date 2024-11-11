import 'package:json_annotation/json_annotation.dart';

part 'accept_ride_request_transaction.g.dart';

@JsonSerializable()
class AcceptRideRequestTransaction {
  @JsonKey(name: 'transaction_id')
  String? transactionId;
  int? amount;
  String? status;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  AcceptRideRequestTransaction({
    this.transactionId,
    this.amount,
    this.status,
    this.paymentMethod,
  });

  factory AcceptRideRequestTransaction.fromJson(Map<String, dynamic> json) {
    return _$AcceptRideRequestTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptRideRequestTransactionToJson(this);
}
