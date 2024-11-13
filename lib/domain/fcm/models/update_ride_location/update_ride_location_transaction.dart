import 'package:json_annotation/json_annotation.dart';

part 'update_ride_location_transaction.g.dart';

@JsonSerializable()
class UpdateRideLocationTransaction {
  @JsonKey(name: 'transaction_id')
  String? transactionId;
  int? amount;
  String? status;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  UpdateRideLocationTransaction({
    this.transactionId,
    this.amount,
    this.status,
    this.paymentMethod,
  });

  factory UpdateRideLocationTransaction.fromJson(Map<String, dynamic> json) {
    return _$UpdateRideLocationTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateRideLocationTransactionToJson(this);
}
