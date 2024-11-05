import 'package:json_annotation/json_annotation.dart';

part 'geocode_point_request.g.dart';

@JsonSerializable()
class GeocodePointRequest {
  double? lat;
  double? lng;

  GeocodePointRequest({this.lat, this.lng});

  factory GeocodePointRequest.fromJson(Map<String, dynamic> json) =>
      _$GeocodePointRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodePointRequestToJson(this);
}
