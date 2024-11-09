import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';

part 'hitch_ride_complete_state.g.dart';

@CopyWith()
class HitchRideCompleteState {
  final bool isLoading;

  HitchRideCompleteState({
    this.isLoading = false,
  });
}
