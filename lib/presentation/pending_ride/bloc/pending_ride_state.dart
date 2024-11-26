import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';

part 'pending_ride_state.g.dart';

@CopyWith()
class PendingRideState {
  final bool isLoading;
  final bool dataChange;
  final List<GiveRideRecommendationOuput> pendingRideOffer;
  final List<HitchRideRecommendationOuput> pendingRideRequest;
  final int selectedButtonIndex;

  PendingRideState({
    this.isLoading = false,
    this.dataChange = false,
    this.pendingRideRequest = const [],
    this.pendingRideOffer = const [],
    this.selectedButtonIndex = 0,
  });
}
