import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/vehicle/request/register_vehicle_request/register_vehicle_request.dart';
import 'package:share_way_frontend/data/api/vehicle/request/vehicles_request/vehicles_request.dart';
import 'package:share_way_frontend/data/api/vehicle/response/get_vehicle_response/get_vehicle_response.dart';
import 'package:share_way_frontend/data/api/vehicle/response/vehicles_response/vehicles_response.dart';

class VehicleService {
  final _service = ApiService();

  Future<VehiclesResponse?> getVehicles(VehiclesRequest request) async {
    final response = await _service.get(
      VehicleApi.getVehicles,
      params: request.toJson(),
      fromJson: (json) => VehiclesResponse.fromJson(json),
    );
    return response;
  }

  Future<bool> registerVehicle(RegisterVehicleRequest request) async {
    final response = await _service.post(
      VehicleApi.registerVehicle,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<GetVehicleResponse?> getUserVehicle() async {
    final response = await _service.get(
      VehicleApi.getUserVehicle,
      fromJson: (json) => GetVehicleResponse.fromJson(json),
    );
    return response;
  }
}
