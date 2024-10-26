import 'package:json_annotation/json_annotation.dart';

part 'autocomplete_structured_formatting_response.g.dart';

@JsonSerializable()
class AutocompleteStructuredFormattingResponse {
  @JsonKey(name: 'main_text')
  String? mainText;
  @JsonKey(name: 'secondary_text')
  String? secondaryText;

  AutocompleteStructuredFormattingResponse({this.mainText, this.secondaryText});

  factory AutocompleteStructuredFormattingResponse.fromJson(Map<String, dynamic> json) {
    return _$AutocompleteStructuredFormattingResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutocompleteStructuredFormattingResponseToJson(this);
}
