import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/auth/auth_service.dart';
import 'package:share_way_frontend/data/api/auth/request/register_request/register_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_id_card_request/verify_id_card_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_login_otp_request/verify_login_otp_request.dart';
import 'package:share_way_frontend/data/api/auth/request/verify_register_otp_request/verify_register_otp_request.dart';
import 'package:share_way_frontend/domain/auth/input/register_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_id_card_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_login_otp_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_register_otp_input.dart';
import 'package:share_way_frontend/domain/auth/ouput/verify_id_card_output.dart';
import 'package:share_way_frontend/domain/auth/ouput/verify_login_otp_output.dart';

class AuthRepository {
  final _service = AuthService();

  // register
  Future<bool> initRegister(String phoneNumber) async {
    try {
      final response = await _service.initRegister(phoneNumber);
      return (response != null);
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<bool> resendOtp(String phoneNumber) async {
    try {
      final response = await _service.resendOtp(phoneNumber);
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return false;
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
      return response?.data?.userId;
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
        final result = VerifyIdCardOutput.fromApiModel(response);
        return result;
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return null;
  }

  // login
  Future<String?> loginPhone(String phoneNumber) async {
    try {
      final response = await _service.loginPhone(phoneNumber);
      final result = response?.data?.userId;
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<VerifyLoginOtpOutput?> verifyLoginOtp(
      VerifyLoginOtpInput input) async {
    try {
      final response = await _service
          .verifyLoginOtp(VerifyLoginOtpRequest.toApiModel(input));
      if (response != null) {
        final result = VerifyLoginOtpOutput.fromApiModel(response);
        return result;
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return null;
  }

  // logout
  Future<bool> logout() async {
    try {
      final response = await _service.logout();
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return false;
  }
}
