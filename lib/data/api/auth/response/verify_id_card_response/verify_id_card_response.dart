import 'package:json_annotation/json_annotation.dart';

import 'verify_id_card_data_response.dart';

part 'verify_id_card_response.g.dart';

@JsonSerializable()
class VerifyIdCardResponse {
  VerifyIdCardDataesponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  VerifyIdCardResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory VerifyIdCardResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyIdCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyIdCardResponseToJson(this);
}
