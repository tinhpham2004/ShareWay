import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';

part 'give_ride_pick_time_state.g.dart';

@CopyWith()
class GiveRidePickTimeState {
  final bool isLoading;
  final CreateGiveRideInput? createGiveRideInput;
  final List<String> timeList;
  final bool dataChange;
  final int selectedRadioIndex;
  final DateTime? selectedDateTime;

  GiveRidePickTimeState({
    this.isLoading = false,
    this.createGiveRideInput,
    this.timeList = const [],
    this.dataChange = false,
    this.selectedRadioIndex = 0,
    this.selectedDateTime,
  });
}
