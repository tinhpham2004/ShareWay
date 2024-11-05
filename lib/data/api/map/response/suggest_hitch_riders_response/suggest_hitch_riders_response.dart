import 'package:json_annotation/json_annotation.dart';

import 'suggest_hitch_riders_data_response.dart';

part 'suggest_hitch_riders_response.g.dart';

@JsonSerializable()
class SuggestHitchRidersResponse {
  SuggestHitchRidersDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  SuggestHitchRidersResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory SuggestHitchRidersResponse.fromJson(Map<String, dynamic> json) {
    return _$SuggestHitchRidersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuggestHitchRidersResponseToJson(this);
}
