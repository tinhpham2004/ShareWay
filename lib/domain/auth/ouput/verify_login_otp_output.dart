import 'package:share_way_frontend/data/api/auth/response/verify_login_otp_response/verify_login_otp_response.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class VerifyLoginOtpOutput {
  final String? accessToken;
  final String? refreshToken;
  final AppUser? appUser;
  final String? messageVi;
  VerifyLoginOtpOutput({
    this.accessToken,
    this.refreshToken,
    this.appUser,
    this.messageVi,
  });

  factory VerifyLoginOtpOutput.fromApiModel(VerifyLoginOtpResponse data) {
    return VerifyLoginOtpOutput(
      accessToken: data.data?.accessToken,
      refreshToken: data.data?.refreshToken,
      appUser: AppUser.fromApiModel(data.data?.user ?? UserResponse()),
      messageVi: data.messageVi,
    );
  }
}
