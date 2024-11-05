import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_leg_response.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
part 'create_give_ride_location_output.g.dart';

@CopyWith()
class CreateGiveRideLocationOutput {
  final String? mainAddress;
  final String? secondaryAddress;
  final Geocode? location;
  final String? distance;

  CreateGiveRideLocationOutput({
    this.mainAddress,
    this.secondaryAddress,
    this.location,
    this.distance,
  });

  factory CreateGiveRideLocationOutput.fromApiModel(
      CreateGiveRideLegResponse response) {
    final mainAddress = response.endAddress?.split(',').first;
    final secondaryAddress = response.endAddress?.split(',').skip(1).join(',');
    return CreateGiveRideLocationOutput(
      mainAddress: mainAddress,
      secondaryAddress: secondaryAddress,
      location: Geocode(
        latitude: response.endLocation!.lat!,
        longitude: response.endLocation!.lng!,
      ),
      distance: response.distance?.text,
    );
  }
}
