import 'package:json_annotation/json_annotation.dart';

import 'suggest_give_riders_data_response.dart';

part 'suggest_give_riders_response.g.dart';

@JsonSerializable()
class SuggestGiveRidersResponse {
  SuggestGiveRidersDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  SuggestGiveRidersResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory SuggestGiveRidersResponse.fromJson(Map<String, dynamic> json) {
    return _$SuggestGiveRidersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuggestGiveRidersResponseToJson(this);
}
