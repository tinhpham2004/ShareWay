import 'package:json_annotation/json_annotation.dart';

import 'register_data_reponse.dart';

part 'register_reponse.g.dart';

@JsonSerializable()
class RegisterReponse {
  RegisterDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  RegisterReponse(
      {this.data, this.error, this.messageEn, this.messageVi, this.success});

  factory RegisterReponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterReponseFromJson(json);
}
