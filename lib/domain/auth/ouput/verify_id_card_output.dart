import 'package:share_way_frontend/data/api/auth/response/verify_id_card_response/verify_id_card_response.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class VerifyIdCardOutput {
  final String? accessToken;
  final String? refreshToken;
  final AppUser? appUser;
  final String? messageVi;
  VerifyIdCardOutput({
    this.accessToken,
    this.refreshToken,
    this.appUser,
    this.messageVi,
  });

  factory VerifyIdCardOutput.fromApiModel(VerifyIdCardResponse data) {
    return VerifyIdCardOutput(
        accessToken: data.data?.accessToken,
        refreshToken: data.data?.refreshToken,
        appUser:
            AppUser.fromApiModel(data.data?.user ?? UserResponse()),
        messageVi: data.messageVi);
  }
}
