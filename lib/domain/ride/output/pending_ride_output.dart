import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_response.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
part 'pending_ride_output.g.dart';

@CopyWith()
class PendingRideOutput {
  List<GiveRideRecommendationOuput>? pendingRideOffer;
  List<HitchRideRecommendationOuput>? pendingRideRequest;

  PendingRideOutput({this.pendingRideRequest, this.pendingRideOffer});

  factory PendingRideOutput.fromApiModel(PendingRideResponse response){
    return PendingRideOutput(
      pendingRideRequest: response.data?.pendingRideRequest?.map((e) => HitchRideRecommendationOuput.fromPendingRide(e)).toList(),
      pendingRideOffer: response.data?.pendingRideOffer?.map((e) => GiveRideRecommendationOuput.fromPendingRide(e)).toList(),
    );
  }
}