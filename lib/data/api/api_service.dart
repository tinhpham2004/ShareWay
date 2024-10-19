import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';

class ApiService {
  late Dio _dio;

  // Base URL of your API
  final String _baseUrl = 'https://shareway.hungnq.online';
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
          final statusCode = error.response?.statusCode;

          // Handle 401 error and refresh token
          if (statusCode == 401 || statusCode == 403) {
            RequestOptions options = error.requestOptions;

            // If refreshing token fails, return the error
            bool isRefreshed = await _refreshTokenIfNeeded();
            if (!isRefreshed) {
              return handler.next(error); // Return the error as it is
            }

            // Retry the original request with new access token
            options.headers[kAccessToken] =
                'Bearer ${await Preferences.getAccessToken()}';
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
    try {
      final response = await _dio.post(
        '/auth/refresh-token',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final accessToken = response.data['data']['access_token'];
        final newRefreshToken = response.data['data']['refresh_token'];
        await Preferences.saveToken(
          accessToken: accessToken,
          refreshToken: newRefreshToken,
        );
        return true;
      }
    } catch (e) {
      print('Failed to refresh token: $e');
      return false;
    }

    return false;
  }

  // General method to handle all types of requests
  Future<T> _performRequest<T>(
    String method,
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      // Set Content-Type dynamically based on data type
      String contentType =
          data is FormData ? 'multipart/form-data' : 'application/json';

      _dio.options.headers['Content-Type'] = contentType;
      debugPrint(
          '$method Request => URL: $uri \nParams: $queryParameters\nHeaders: ${_dio.options.headers}');
      final response = await _dio.request(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(method: method),
      );

      // Parse response and return as type T
      return fromJson(response.data);
    } on SocketException {
      throw const SocketException('No internet connection');
    } on FormatException {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      debugPrint('Error during $method: $e');
      rethrow;
    }
  }

  // GET request using _performRequest
  Future<T?> get<T>(
    String endpoint, {
    Map<String, dynamic>? params,
    required T Function(dynamic json) fromJson,
  }) async {
    return _performRequest<T>(
      'GET',
      endpoint,
      queryParameters: params,
      fromJson: fromJson,
    );
  }

  // POST request using _performRequest, with dynamic Content-Type handling
  Future<T?> post<T>(
    String endpoint, {
    dynamic data, // Accept FormData or Map<String, dynamic>
    required T Function(dynamic json) fromJson,
  }) async {
    return _performRequest<T>(
      'POST',
      endpoint,
      data: data,
      fromJson: fromJson,
    );
  }

  // PUT request using _performRequest, with dynamic Content-Type handling
  Future<T?> put<T>(
    String endpoint, {
    dynamic data, // Accept FormData or Map<String, dynamic>
    required T Function(dynamic json) fromJson,
  }) async {
    return _performRequest<T>(
      'PUT',
      endpoint,
      data: data,
      fromJson: fromJson,
    );
  }

  // DELETE request using _performRequest
  Future<T?> delete<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    required T Function(dynamic json) fromJson,
  }) async {
    return _performRequest<T>(
      'DELETE',
      endpoint,
      data: data,
      fromJson: fromJson,
    );
  }
}
