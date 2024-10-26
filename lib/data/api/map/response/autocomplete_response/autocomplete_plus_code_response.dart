import 'package:json_annotation/json_annotation.dart';

part 'autocomplete_plus_code_response.g.dart';

@JsonSerializable()
class AutocompletePlusCodeResponse {
  @JsonKey(name: 'compound_code')
  String? compoundCode;
  @JsonKey(name: 'global_code')
  String? globalCode;

  AutocompletePlusCodeResponse({this.compoundCode, this.globalCode});

  factory AutocompletePlusCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$AutocompletePlusCodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutocompletePlusCodeResponseToJson(this);
}
