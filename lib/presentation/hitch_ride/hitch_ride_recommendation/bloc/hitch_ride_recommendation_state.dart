import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';

part 'hitch_ride_recommendation_state.g.dart';

@CopyWith()
class HitchRideRecommendationState {
  final bool isLoading;
  final bool dataChange;
  final List<GiveRideRecommendationOuput> giveRideRecommendationList;
  final String? hitchRideId;

  HitchRideRecommendationState({
    this.isLoading = false,
    this.dataChange = false,
    this.giveRideRecommendationList = const [],
    this.hitchRideId,
  });
}
