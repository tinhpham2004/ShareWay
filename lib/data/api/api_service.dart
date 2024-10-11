import 'dart:async';
import 'package:dio/dio.dart';
import 'package:share_way_frontend/data/local/preferences.dart';

class ApiService {
  late Dio _dio;

  // Base URL of your API
  final String _baseUrl = 'https://yourapi.com';
  static const kAccessToken = 'Authorization';

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Add interceptor for token and error handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add Authorization header with Bearer token
          final accessToken = await Preferences.getAccessToken();
          if (accessToken != null) {
            options.headers[kAccessToken] = 'Bearer $accessToken';
          }
          return handler.next(options); // Continue the request
        },
        onError: (DioError error, handler) async {
          // Handle 401 error and refresh token
          if (error.response?.statusCode == 401) {
            RequestOptions options = error.requestOptions;

            // If refreshing token fails, return the error
            bool isRefreshed = await _refreshTokenIfNeeded();
            if (!isRefreshed) {
              return handler.next(error); // Return the error as it is
            }

            // Retry the original request with new access token
            options.headers[kAccessToken] = 'Bearer ${await Preferences.getAccessToken()}';
            final response = await _dio.request(
              options.path,
              options: Options(
                method: options.method,
                headers: options.headers,
              ),
              data: options.data,
              queryParameters: options.queryParameters,
            );

            return handler.resolve(response); // Resolve with the new response
          }

          return handler.next(error); // Other errors
        },
      ),
    );
  }

  // Refresh the token if needed
  Future<bool> _refreshTokenIfNeeded() async {
    final refreshToken = await Preferences.getRefreshToken();
    if (refreshToken == null) {
      return false; // No refresh token available
    }

    try {
      // Make request to refresh token endpoint
      final response = await _dio.post('/auth/refresh-token', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        // Save the new tokens
        final accessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];
        await Preferences.saveToken(accessToken: accessToken, refreshToken: newRefreshToken);
        return true;
      }
    } catch (e) {
      print('Failed to refresh token: $e');
      return false;
    }

    return false;
  }

  // GET request
  Future<Response?> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      print('GET request error: $e');
      return null;
    }
  }

  // POST request
  Future<Response?> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print('POST request error: $e');
      return null;
    }
  }

  // PUT request
  Future<Response?> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      print('PUT request error: $e');
      return null;
    }
  }

  // DELETE request
  Future<Response?> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } catch (e) {
      print('DELETE request error: $e');
      return null;
    }
  }
}
