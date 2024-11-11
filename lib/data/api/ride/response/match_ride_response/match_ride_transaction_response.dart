import 'package:json_annotation/json_annotation.dart';

part 'match_ride_transaction_response.g.dart';

@JsonSerializable()
class MatchRideTransactionResponse {
  int? amount;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  String? status;
  @JsonKey(name: 'transaction_id')
  String? transactionId;

  MatchRideTransactionResponse({
    this.amount,
    this.paymentMethod,
    this.status,
    this.transactionId,
  });

  factory MatchRideTransactionResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchRideTransactionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchRideTransactionResponseToJson(this);
}
