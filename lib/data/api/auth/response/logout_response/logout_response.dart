import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  String? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  LogoutResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
