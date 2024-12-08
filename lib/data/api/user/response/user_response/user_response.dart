import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  String? email;
  @JsonKey(name: 'full_name')
  String? fullName;
  String? id;
  @JsonKey(name: 'is_activated')
  bool? isActivated;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? role;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'average_rating')
  double? averageRating;
  @JsonKey(name: 'gender')
  String? gender;

  UserResponse({
    this.createdAt,
    this.email,
    this.fullName,
    this.id,
    this.isActivated,
    this.isVerified,
    this.phoneNumber,
    this.role,
    this.updatedAt,
    this.avatarUrl,
    this.averageRating,
    this.gender,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
