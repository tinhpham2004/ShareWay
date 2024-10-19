import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/auth/input/register_input.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? email;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  RegisterRequest({this.email, this.fullName, this.phoneNumber});

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  factory RegisterRequest.toApiModel(RegisterInput request) {
    return RegisterRequest(
      email: request.email,
      fullName: request.fullName,
      phoneNumber: request.phoneNumber,
    );
  }
}
