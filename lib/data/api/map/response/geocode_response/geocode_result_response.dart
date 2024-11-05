import 'package:json_annotation/json_annotation.dart';

part 'geocode_result_response.g.dart';

@JsonSerializable()
class GeocodeResultResponse {
  double? distance;
  @JsonKey(name: 'formatted_address')
  String? formattedAddress;
  double? latitude;
  double? longitude;
  @JsonKey(name: 'main_address')
  String? mainAddress;
  @JsonKey(name: 'place_id')
  String? placeId;
  @JsonKey(name: 'secondary_address')
  String? secondaryAddress;

  GeocodeResultResponse({
    this.distance,
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.mainAddress,
    this.placeId,
    this.secondaryAddress,
  });

  factory GeocodeResultResponse.fromJson(Map<String, dynamic> json) {
    return _$GeocodeResultResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeocodeResultResponseToJson(this);
}
