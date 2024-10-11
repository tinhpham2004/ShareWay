import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String kAccessTokenKey = 'access_token';
  static const String kRefreshTokenKey = 'refresh_token';

  // Save both access token and refresh token
  static Future<void> saveToken({required String accessToken, required String refreshToken}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kAccessTokenKey, accessToken);
    await prefs.setString(kRefreshTokenKey, refreshToken);
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kAccessTokenKey);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kRefreshTokenKey);
  }

  // Clear tokens (for logout)
  static Future<void> clearTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kAccessTokenKey);
    await prefs.remove(kRefreshTokenKey);
  }
}
