import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';

part 'hitch_ride_pick_time_state.g.dart';

@CopyWith()
class HitchRidePickTimeState {
  final bool isLoading;
  final CreateHitchRideInput? createHitchRideInput;
  final List<String> timeList;
  final bool dataChange;
  final int selectedRadioIndex;
  final DateTime? selectedDateTime;

  HitchRidePickTimeState({
    this.isLoading = false,
    this.createHitchRideInput,
    this.timeList = const [],
    this.dataChange = false,
    this.selectedRadioIndex = 0,
    this.selectedDateTime,
  });
}
