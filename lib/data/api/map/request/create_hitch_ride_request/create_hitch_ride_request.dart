import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';

part 'create_hitch_ride_request.g.dart';

@JsonSerializable()
class CreateHitchRideRequest {
  @JsonKey(name: 'place_list')
  List<String>? placeList;
  @JsonKey(name: 'start_time')
  DateTime? startTime;

  CreateHitchRideRequest({this.placeList, this.startTime});

  Map<String, dynamic> toJson() => _$CreateHitchRideRequestToJson(this);

  factory CreateHitchRideRequest.toApiModel(CreateHitchRideInput input) {
    return CreateHitchRideRequest(
      placeList:
          input.locationList?.map((item) => item.idString ?? '').toList(),
      startTime: input.startTime,
    );
  }
}
