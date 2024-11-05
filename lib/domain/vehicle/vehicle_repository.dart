import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/vehicle/request/register_vehicle_request/register_vehicle_request.dart';
import 'package:share_way_frontend/data/api/vehicle/request/vehicles_request/vehicles_request.dart';
import 'package:share_way_frontend/data/api/vehicle/vehicle_service.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/vehicle/input/register_vehicle_input.dart';
import 'package:share_way_frontend/domain/vehicle/input/vehicles_input.dart';
import 'package:share_way_frontend/domain/vehicle/output/get_vehicle_ouput.dart';

class VehicleRepository {
  final _service = VehicleService();

  Future<List<OptionItem>?> getVehicles(VehiclesInput input) async {
    try {
      final result =
          await _service.getVehicles(VehiclesRequest.toApiModel(input));
      if (result != null) {
        return result.data?.vehicles
            ?.map((e) => OptionItem(
                  idString: e.vehicleId,
                  name: e.name,
                ))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<bool> registerVehicle(RegisterVehicleInput input) async {
    try {
      final result = await _service
          .registerVehicle(RegisterVehicleRequest.toApiModel(input));

      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<List<GetVehicleOuput>?> getUserVehicle() async {
    try {
      final result = await _service.getUserVehicle();
      if (result != null) {
        return result.data?.vehicle
            ?.map((e) => GetVehicleOuput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }
}
