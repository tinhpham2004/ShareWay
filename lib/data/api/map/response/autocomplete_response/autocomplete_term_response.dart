import 'package:json_annotation/json_annotation.dart';

part 'autocomplete_term_response.g.dart';

@JsonSerializable()
class AutocompleteTermResponse {
  int? offset;
  String? value;

  AutocompleteTermResponse({this.offset, this.value});

  factory AutocompleteTermResponse.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteTermResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AutocompleteTermResponseToJson(this);
}
