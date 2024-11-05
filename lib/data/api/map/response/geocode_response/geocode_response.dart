import 'package:json_annotation/json_annotation.dart';

import 'geocode_data_response.dart';

part 'geocode_response.g.dart';

@JsonSerializable()
class GeocodeResponse {
  GeocodeDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  GeocodeResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory GeocodeResponse.fromJson(Map<String, dynamic> json) {
    return _$GeocodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeocodeResponseToJson(this);
}
