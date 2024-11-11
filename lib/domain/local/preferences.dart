import 'dart:convert';

import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String kAccessTokenKey = 'access_token';
  static const String kRefreshTokenKey = 'refresh_token';
  static const String kUserIdey = 'user_id';
  static const String kAuthDataKey = 'auth_data';
  static const String kCurrentLocationKey = 'current_location';

  // Save both access token and refresh token
  static Future<void> saveToken(
      {required String accessToken,
      required String refreshToken,
      required String userId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kAccessTokenKey, accessToken);
    await prefs.setString(kRefreshTokenKey, refreshToken);
    await prefs.setString(kUserIdey, userId);
    print('Access token: $accessToken');
    print('Refresh token: $refreshToken');
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

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kUserIdey);
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

  static Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> saveCurrentLocation(Geocode location) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String locationJson = jsonEncode(location.toJson());
    await prefs.setString(kCurrentLocationKey, locationJson);
  }

  static Future<Geocode?> getCurrentLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? locationJson = prefs.getString(kCurrentLocationKey);
    if (locationJson != null) {
      final jsonData = jsonDecode(locationJson);
      return Geocode.fromJson(jsonData);
    }
    return null;
  }
}
