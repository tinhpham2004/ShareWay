import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/vehicle/input/register_vehicle_input.dart';

part 'register_vehicle_request.g.dart';

@JsonSerializable()
class RegisterVehicleRequest {
  @JsonKey(name: 'ca_vet')
  String? caVet;
  @JsonKey(name: 'license_plate')
  String? licensePlate;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;

  RegisterVehicleRequest({
    this.caVet,
    this.licensePlate,
    this.userId,
    this.vehicleId,
  });

  factory RegisterVehicleRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterVehicleRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterVehicleRequestToJson(this);

  factory RegisterVehicleRequest.toApiModel(RegisterVehicleInput input) {
    return RegisterVehicleRequest(
      caVet: input.cavetNumber,
      licensePlate: input.licensePlate,
      userId: input.userId,
      vehicleId: input.vehicleId,
    );
  }
}
