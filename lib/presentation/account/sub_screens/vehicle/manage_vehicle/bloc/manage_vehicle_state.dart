import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/vehicle/output/get_vehicle_ouput.dart';

part 'manage_vehicle_state.g.dart';

@CopyWith()
class ManageVehicleState {
  final bool isLoading;
  final bool dataChange;
  final List<GetVehicleOuput> vehicles;

  ManageVehicleState({
    this.isLoading = false,
    this.dataChange = false,
    this.vehicles = const [],
  });
}
