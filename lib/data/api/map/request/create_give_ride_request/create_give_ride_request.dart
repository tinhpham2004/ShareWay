import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';

part 'create_give_ride_request.g.dart';

@JsonSerializable()
class CreateGiveRideRequest {
  @JsonKey(name: 'place_list')
  List<String>? placeList;
  @JsonKey(name: 'start_time')
  DateTime? startTime;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  CreateGiveRideRequest({this.placeList, this.startTime, this.vehicleId});

  Map<String, dynamic> toJson() => _$CreateGiveRideRequestToJson(this);

  factory CreateGiveRideRequest.toApiModel(CreateGiveRideInput input) {
    return CreateGiveRideRequest(
        placeList:
            input.locationList?.map((item) => item.idString ?? '').toList(),
        startTime: input.startTime,
        vehicleId: input.vehicleId);
  }
}
