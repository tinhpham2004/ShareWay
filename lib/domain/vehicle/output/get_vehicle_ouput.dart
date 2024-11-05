import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/vehicle/response/get_vehicle_response/get_vehicle_item_response.dart';
part 'get_vehicle_ouput.g.dart';

@CopyWith()
class GetVehicleOuput {
  String? vehicleId;
  String? name;
  double? fuelConsumed;
  String? licensePlate;

  GetVehicleOuput({
    this.vehicleId,
    this.name,
    this.fuelConsumed,
    this.licensePlate,
  });

  factory GetVehicleOuput.fromApiModel(GetVehicleItemResponse response) {
    return GetVehicleOuput(
      vehicleId: response.vehicleId,
      name: response.name,
      fuelConsumed: response.fuelConsumed,
      licensePlate: response.licensePlate,
    );
  }
}
