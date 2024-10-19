import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';

part 'verify_id_card_data_response.g.dart';

@JsonSerializable()
class VerifyIdCardDataesponse {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  UserResponse? user;

  VerifyIdCardDataesponse({this.accessToken, this.refreshToken, this.user});

  factory VerifyIdCardDataesponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyIdCardDataesponseFromJson(json);
}
