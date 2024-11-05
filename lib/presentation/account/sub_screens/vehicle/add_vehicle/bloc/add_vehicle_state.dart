import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';

part 'add_vehicle_state.g.dart';

@CopyWith()
class AddVehicleState {
  final bool isLoading;
  final bool dataChange;
  final List<OptionItem> vehicles;
  final OptionItem? selectedVehicle;
  final String? licensePlate;
  final String? cavetNumber;
  final int pageKey;
  final bool hasMoreData;
  final int pageSize;

  AddVehicleState({
    this.isLoading = false,
    this.dataChange = false,
    this.vehicles = const [],
    this.selectedVehicle,
    this.licensePlate,
    this.cavetNumber,
    this.pageSize = 20,
    this.pageKey = 1,
    this.hasMoreData = true,
  });
}
