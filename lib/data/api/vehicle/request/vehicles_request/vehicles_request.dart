import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/vehicle/input/vehicles_input.dart';
part 'vehicles_request.g.dart';

@JsonSerializable()
class VehiclesRequest {
  String? input;
  int? limit;
  int? page;

  VehiclesRequest({
    this.input,
    this.limit,
    this.page,
  });

  factory VehiclesRequest.fromJson(Map<String, dynamic> json) =>
      _$VehiclesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VehiclesRequestToJson(this);

  factory VehiclesRequest.toApiModel(VehiclesInput input) {
    return VehiclesRequest(
      input: input.vehicleName,
      limit: input.limit,
      page: input.page,
    );
  }
}
