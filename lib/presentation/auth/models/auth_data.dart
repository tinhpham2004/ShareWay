import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@CopyWith()
@JsonSerializable()
class AuthData {
  final String phoneNumber;
  final String path;
  final String? email;
  final String? name;
  final String? userId;

  AuthData({
    required this.phoneNumber,
    required this.path,
    this.email,
    this.name,
    this.userId,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
