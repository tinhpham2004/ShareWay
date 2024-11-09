import 'package:copy_with_extension/copy_with_extension.dart';

part 'give_ride_complete_state.g.dart';

@CopyWith()
class GiveRideCompleteState {
  final bool isLoading;

  GiveRideCompleteState({
    this.isLoading = false,
  });
}
