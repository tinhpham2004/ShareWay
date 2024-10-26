import 'package:json_annotation/json_annotation.dart';

import 'autocomplete_prediction_response.dart';

part 'autocomplete_data_response.g.dart';

@JsonSerializable()
class AutocompleteDataResponse {
  List<AutocompletePredictionResponse>? predictions;
  @JsonKey(name: 'executed_time')
  int? executedTime;
  @JsonKey(name: 'executed_time_all')
  int? executedTimeAll;
  String? status;

  AutocompleteDataResponse({
    this.predictions,
    this.executedTime,
    this.executedTimeAll,
    this.status,
  });

  factory AutocompleteDataResponse.fromJson(Map<String, dynamic> json) => _$AutocompleteDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AutocompleteDataResponseToJson(this);
}
