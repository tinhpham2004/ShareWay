import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/user/user_service.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class UserRepository {
  final _service = UserService();

  Future<AppUser?> getProfile() async {
    try {
      final result = await _service.getProfile();
      if (result != null) {
        return AppUser.fromApiModel(result);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<bool> registerDeviceToken(String deviceToken) async {
    try {
      final response = await _service.registerDeviceToken(deviceToken);
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        throw ("$error + $statckTrace");
      }
    }
    return false;
  }
}
