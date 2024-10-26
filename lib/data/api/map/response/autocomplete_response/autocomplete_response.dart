import 'package:json_annotation/json_annotation.dart';

import 'autocomplete_data_response.dart';

part 'autocomplete_response.g.dart';

@JsonSerializable()
class AutocompleteResponse {
  bool? success;
  AutocompleteDataResponse? data;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;

  AutocompleteResponse({
    this.success,
    this.data,
    this.messageEn,
    this.messageVi,
  });

  factory AutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return _$AutocompleteResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutocompleteResponseToJson(this);
}
