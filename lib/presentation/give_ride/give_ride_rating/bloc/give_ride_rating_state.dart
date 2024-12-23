import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';

part 'give_ride_rating_state.g.dart';

@CopyWith()
class GiveRideRatingState {
  final bool isLoading;
  final int? star;
  final String? feedback;

  GiveRideRatingState({
    this.isLoading = false,
    this.star,
    this.feedback,
  });
}
