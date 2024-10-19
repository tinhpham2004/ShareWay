import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/auth/auth_service.dart';
import 'package:share_way_frontend/data/api/auth/request/register_request/register_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_id_card_request/verify_id_card_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_register_otp_request/verify_register_otp_request.dart';
import 'package:share_way_frontend/domain/auth/input/register_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_id_card_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_register_otp_input.dart';
import 'package:share_way_frontend/domain/auth/ouput/verify_id_card_output.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class AuthRepository {
  final _service = AuthService();

  Future<void> initRegister(String phoneNumber) async {
    try {
      await _service.initRegister(phoneNumber);
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
  }

    Future<void> resendOtp(String phoneNumber) async {
    try {
      await _service.resendOtp(phoneNumber);
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
  }

  Future<bool> verifyRegisterOtp(VerifyRegisterOtpInput input) async {
    try {
      final response = await _service
          .verifyRegisterOtp(VerifyRegisterOtpRequest.toApiModel(input));
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<String?> register(RegisterInput input) async {
    try {
      final response =
          await _service.register(RegisterRequest.toApiModel(input));
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<VerifyIdCardOutput?> verifyIdCard(VerifyIdCardInput input) async {
    try {
      final response =
          await _service.verifyIdCard(VerifyIdCardRequest.toApiModel(input));
      if (response != null) {
        return VerifyIdCardOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return null;
  }
}
