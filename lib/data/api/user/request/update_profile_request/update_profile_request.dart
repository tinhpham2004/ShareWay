import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  String? email;
  @JsonKey(name: 'full_name')
  String? fullName;
  String? gender;

  UpdateProfileRequest({this.email, this.fullName, this.gender});

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);

  factory UpdateProfileRequest.toApiModel(AppUser input) {
    return UpdateProfileRequest(
      email: input.email,
      fullName: input.fullName,
      gender: input.gender.toString(),
    );
  }
}
