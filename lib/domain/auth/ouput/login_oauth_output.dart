import 'package:share_way_frontend/data/api/auth/response/login_oauth_response/login_oauth_response.dart';

class LoginOauthOutput {
  final String? phoneNumber;
  final String? userId;
  LoginOauthOutput({
    this.phoneNumber,
    this.userId,
  });

  factory LoginOauthOutput.fromApiModel(LoginOauthResponse data) {
    return LoginOauthOutput(
      phoneNumber: data.data?.phoneNumber,
      userId: data.data?.userId,
    );
  }
}
