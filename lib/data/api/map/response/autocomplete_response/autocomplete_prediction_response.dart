import 'package:json_annotation/json_annotation.dart';

import 'autocomplete_plus_code_response.dart';
import 'autocomplete_structured_formatting_response.dart';
import 'autocomplete_term_response.dart';

part 'autocomplete_prediction_response.g.dart';

@JsonSerializable()
class AutocompletePredictionResponse {
  String? description;
  @JsonKey(name: 'matched_substrings')
  List<dynamic>? matchedSubstrings;
  @JsonKey(name: 'place_id')
  String? placeId;
  String? reference;
  @JsonKey(name: 'structured_formatting')
  AutocompleteStructuredFormattingResponse? structuredFormatting;
  List<AutocompleteTermResponse>? terms;
  @JsonKey(name: 'has_children')
  bool? hasChildren;
  @JsonKey(name: 'display_type')
  String? displayType;
  int? score;
  @JsonKey(name: 'plus_code')
  AutocompletePlusCodeResponse? plusCode;
  double? distance;

  AutocompletePredictionResponse({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.hasChildren,
    this.displayType,
    this.score,
    this.plusCode,
    this.distance,
  });

  factory AutocompletePredictionResponse.fromJson(Map<String, dynamic> json) {
    return _$AutocompletePredictionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutocompletePredictionResponseToJson(this);
}
