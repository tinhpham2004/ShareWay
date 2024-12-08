import 'package:copy_with_extension/copy_with_extension.dart';

part 'hitch_ride_rating_state.g.dart';

@CopyWith()
class HitchRideRatingState {
  final bool isLoading;
  final int? star;
  final String? feedback;

  HitchRideRatingState({
    this.isLoading = false,
    this.star,
    this.feedback,
  });
}
