import 'dart:convert';

import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String kAccessTokenKey = 'access_token';
  static const String kRefreshTokenKey = 'refresh_token';
  static const String kAuthDataKey = 'auth_data';

  // Save both access token and refresh token
  static Future<void> saveToken(
      {required String accessToken, required String refreshToken}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kAccessTokenKey, accessToken);
    await prefs.setString(kRefreshTokenKey, refreshToken);
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kAccessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kRefreshTokenKey);
  }

  static Future<void> clearTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kAccessTokenKey);
    await prefs.remove(kRefreshTokenKey);
  }

  static Future<void> saveAuthData(AuthData authData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String authDataJson = jsonEncode(authData.toJson());
    await prefs.setString(kAuthDataKey, authDataJson);
  }

  static Future<AuthData?> getAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authDataJson = prefs.getString(kAuthDataKey);

    if (authDataJson != null) {
      Map<String, dynamic> jsonData = jsonDecode(authDataJson);
      return AuthData.fromJson(jsonData);
    }
    return null;
  }

  static Future<void> clearAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kAuthDataKey);
  }
}
