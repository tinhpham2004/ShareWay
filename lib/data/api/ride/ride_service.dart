import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/ride/request/ride_request.dart';

class RideService {
  final _service = ApiService();

  Future<bool> sendHitchRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.hitchRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<bool> sendGiveRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.givehRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }
}
