import 'dart:developer';

import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/auth/request/register_request/register_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_id_card_request/verify_id_card_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_register_otp_request/verify_register_otp_request.dart';
import 'package:share_way_frontend/data/api/auth/response/register_reponse/register_data_reponse.dart';
import 'package:share_way_frontend/data/api/auth/response/verify_id_card_response/verify_id_card_response.dart';

class AuthService {
  final _service = ApiService();

  Future<void> initRegister(
    String phoneNumber,
  ) async {
    await _service.post(
      AuthApi.initRegister,
      data: {'phone_number': phoneNumber},
      fromJson: (json) => null,
    );
  }

  Future<void> resendOtp(
    String phoneNumber,
  ) async {
    await _service.post(
      AuthApi.resendOtp,
      data: {'phone_number': phoneNumber},
      fromJson: (json) => null,
    );
  }

  Future<bool> verifyRegisterOtp(VerifyRegisterOtpRequest request) async {
    final response = await _service.post(
      AuthApi.verifyRegisterOtp,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<String?> register(RegisterRequest request) async {
    final response = await _service.post(
      AuthApi.register,
      data: request.toJson(),
      fromJson: (json) => RegisterDataResponse.fromJson(json['data']),
    );

    return response?.userId;
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
}
