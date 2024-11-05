import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';

import 'geocode_current_location_request.dart';
import 'geocode_point_request.dart';

part 'geocode_request.g.dart';

@JsonSerializable()
class GeocodeRequest {
  @JsonKey(name: 'current_location')
  GeocodeCurrentLocationRequest? currentLocation;
  GeocodePointRequest? point;

  GeocodeRequest({this.currentLocation, this.point});

  factory GeocodeRequest.fromJson(Map<String, dynamic> json) {
    return _$GeocodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeocodeRequestToJson(this);

  factory GeocodeRequest.toApiModel(List<Geocode> input) {
    return GeocodeRequest(
      currentLocation: GeocodeCurrentLocationRequest(
        lat: input.first.latitude,
        lng: input.first.longitude,
      ),
      point: GeocodePointRequest(
        lat: input.last.latitude,
        lng: input.last.longitude,
      ),
    );
  }
}
