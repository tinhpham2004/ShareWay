import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_response.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_location_output.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
part 'create_give_ride_output.g.dart';

@CopyWith()
class CreateGiveRideOutput {
  final String? giveRideId;
  final List<CreateGiveRideLocationOutput?> locationList;
  final String? polyline;
  final int? distance;
  final int? duration;
  final double? fare;
  final String? vehicle;
  final String? vehicleId;

  CreateGiveRideOutput({
    this.giveRideId,
    this.locationList = const [],
    this.polyline,
    this.distance,
    this.duration,
    this.fare,
    this.vehicle,
    this.vehicleId,
  });

  factory CreateGiveRideOutput.fromApiModel(CreateGiveRideResponse response) {
    return CreateGiveRideOutput(
      giveRideId: response.data?.rideOfferId,
      locationList: [
        CreateGiveRideLocationOutput(
          mainAddress: response
              .data?.route?.routes?.first.legs?.first.startAddress
              ?.split(',')
              .first,
          secondaryAddress: response
              .data?.route?.routes?.first.legs?.first.startAddress
              ?.split(',')
              .skip(1)
              .join(','),
          location: Geocode(
            latitude: response.data?.route?.routes?.first.legs?.first
                    .startLocation?.lat ??
                0.0,
            longitude: response.data?.route?.routes?.first.legs?.first
                    .startLocation?.lng ??
                0.0,
          ),
          distance: "0.0 km",
        ),
        ...response.data?.route?.routes?.first.legs
                ?.map((e) => CreateGiveRideLocationOutput.fromApiModel(e))
                .toList() ??
            []
      ],
      polyline: response.data?.route?.routes?.first.overviewPolyline?.points,
      distance: response.data?.distance,
      duration: response.data?.duration,
      fare: response.data?.fare,
      vehicle:
          "${response.data?.vehicle?.name ?? ''} ${response.data?.vehicle?.licensePlate ?? ''}",
      vehicleId: response.data?.vehicle?.vehicleId,
    );
  }
}
