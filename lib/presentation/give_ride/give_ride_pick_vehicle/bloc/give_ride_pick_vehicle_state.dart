import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/vehicle/output/get_vehicle_ouput.dart';

part 'give_ride_pick_vehicle_state.g.dart';

@CopyWith()
class GiveRidePickVehicleState {
  final bool isLoading;
  final bool dataChange;
  final List<GetVehicleOuput> vehicles;
  final int selectedVehicleIndex;
  final CreateGiveRideInput? createGiveRideInput;

  GiveRidePickVehicleState({
    this.isLoading = false,
    this.dataChange = false,
    this.vehicles = const [],
    this.selectedVehicleIndex = 0,
    this.createGiveRideInput,
  });
}
