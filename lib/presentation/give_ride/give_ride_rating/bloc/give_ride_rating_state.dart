import 'package:copy_with_extension/copy_with_extension.dart';

part 'give_ride_rating_state.g.dart';

@CopyWith()
class GiveRideRatingState {
  final bool isLoading;

  GiveRideRatingState({
    this.isLoading = false,
  });
}
