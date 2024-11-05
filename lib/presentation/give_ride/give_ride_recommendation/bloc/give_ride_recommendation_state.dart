import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';

part 'give_ride_recommendation_state.g.dart';

@CopyWith()
class GiveRideRecommendationState {
  final bool isLoading;
  final bool dataChange;
  final List<HitchRideRecommendationOuput> hitchRideRecommendationList;

  GiveRideRecommendationState({
    this.isLoading = false,
    this.dataChange = false,
    this.hitchRideRecommendationList = const [],
  });
}
