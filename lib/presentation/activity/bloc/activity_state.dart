import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/ride/output/history_ride_output/history_ride_output.dart';

part 'activity_state.g.dart';

@CopyWith()
class ActivityState {
  final bool isLoading;
  final bool dataChange;
  final List<HistoryRideOutput> rideList;

  ActivityState({
    this.isLoading = false,
    this.dataChange = false,
    this.rideList = const [],
  });
}
