import 'package:json_annotation/json_annotation.dart';

part 'geocode_current_location_request.g.dart';

@JsonSerializable()
class GeocodeCurrentLocationRequest {
  double? lat;
  double? lng;

  GeocodeCurrentLocationRequest({this.lat, this.lng});

  factory GeocodeCurrentLocationRequest.fromJson(Map<String, dynamic> json) {
    return _$GeocodeCurrentLocationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeocodeCurrentLocationRequestToJson(this);
}
