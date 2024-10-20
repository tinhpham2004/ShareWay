import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/auth/request/register_request/register_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_id_card_request/verify_id_card_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_login_otp_request/verify_login_otp_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_register_otp_request/verify_register_otp_request.dart';
import 'package:share_way_frontend/data/api/auth/response/init_register_response/init_register_response.dart';
import 'package:share_way_frontend/data/api/auth/response/login_oauth_response/login_oauth_response.dart';
import 'package:share_way_frontend/data/api/auth/response/login_phone_response/login_phone_response.dart';
import 'package:share_way_frontend/data/api/auth/response/register_response/register_response.dart';
import 'package:share_way_frontend/data/api/auth/response/verify_id_card_response/verify_id_card_response.dart';
import 'package:share_way_frontend/data/api/auth/response/verify_login_otp_response/verify_login_otp_response.dart';

class AuthService {
  final _service = ApiService();

  // register
  Future<InitRegisterResponse?> initRegister(
    String phoneNumber,
  ) async {
    final response = await _service.post(
      AuthApi.initRegister,
      data: {'phone_number': phoneNumber},
      fromJson: (json) => InitRegisterResponse.fromJson(json),
    );
    return response;
  }

  Future<bool> resendOtp(
    String phoneNumber,
  ) async {
    final response = await _service.post(
      AuthApi.resendOtp,
      data: {'phone_number': phoneNumber},
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<bool> verifyRegisterOtp(VerifyRegisterOtpRequest request) async {
    final response = await _service.post(
      AuthApi.verifyRegisterOtp,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<RegisterResponse?> register(RegisterRequest request) async {
    final response = await _service.post(
      AuthApi.register,
      data: request.toJson(),
      fromJson: (json) => RegisterResponse.fromJson(json),
    );
    return response;
  }

  Future<VerifyIdCardResponse?> verifyIdCard(
      VerifyIdCardRequest request) async {
    final response = await _service.post(
      AuthApi.verifyIdCard,
      data: request.toFormData(),
      fromJson: (json) => VerifyIdCardResponse.fromJson(json),
    );
    return response;
  }

  // login
  Future<LoginPhoneResponse?> loginPhone(String phoneNumber) async {
    final response = await _service.post(
      AuthApi.loginPhone,
      data: {'phone_number': phoneNumber},
      fromJson: (json) => LoginPhoneResponse.fromJson(json),
    );
    return response;
  }

  Future<LoginOauthResponse?> loginOauth(String email) async {
    final response = await _service.post(
      AuthApi.loginOauth,
      data: {'email': email},
      fromJson: (json) => LoginOauthResponse.fromJson(json),
    );
    return response;
  }

  Future<VerifyLoginOtpResponse?> verifyLoginOtp(
      VerifyLoginOtpRequest request) async {
    final response = await _service.post(
      AuthApi.verifyLoginOtp,
      data: request.toJson(),
      fromJson: (json) => VerifyLoginOtpResponse.fromJson(json),
    );
    return response;
  }

  // logout
  Future<bool> logout() async {
    final response = await _service.logout();
    return response;
  }
}
