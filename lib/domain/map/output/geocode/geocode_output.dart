import 'package:share_way_frontend/data/api/map/response/geocode_response/geocode_result_response.dart';

class GeocodeOutput {
  final String? placeId;
  final String? description;
  final double? latitude;
  final double? longitude;
  final String? mainAddress;
  final String? secondaryAddress;
  final double? distance;

  GeocodeOutput({
    this.placeId,
    this.description,
    this.latitude,
    this.longitude,
    this.mainAddress,
    this.secondaryAddress,
    this.distance,
  });

  factory GeocodeOutput.fromApiModel(GeocodeResultResponse response) {
    return GeocodeOutput(
      placeId: response.placeId,
      description: response.formattedAddress,
      latitude: response.latitude,
      longitude: response.longitude,
      mainAddress: response.mainAddress,
      secondaryAddress: response.secondaryAddress,
      distance: response.distance,
    );
  }
}
