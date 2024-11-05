import 'package:json_annotation/json_annotation.dart';

import 'geocode_result_response.dart';

part 'geocode_data_response.g.dart';

@JsonSerializable()
class GeocodeDataResponse {
  List<GeocodeResultResponse>? results;

  GeocodeDataResponse({this.results});

  factory GeocodeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodeDataResponseToJson(this);
}
