import 'package:json_annotation/json_annotation.dart';

part 'history_ride_transaction_response.g.dart';

@JsonSerializable()
class HistoryRideTransactionResponse {
  int? amount;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  String? status;
  @JsonKey(name: 'transaction_id')
  String? transactionId;

  HistoryRideTransactionResponse({
    this.amount,
    this.paymentMethod,
    this.status,
    this.transactionId,
  });

  factory HistoryRideTransactionResponse.fromJson(Map<String, dynamic> json) {
    return _$HistoryRideTransactionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryRideTransactionResponseToJson(this);
}
