import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiErrorHandler {
  static String getMessage(dynamic error) {
    String errorDescription = "Unknown error occurred";

    if (error is http.Response) {
      errorDescription = _handleHttpResponse(error);
    } else if (error is Exception) {
      errorDescription = "Unexpected error occurred: ${error.toString()}";
    } else {
      errorDescription = "Unknown error occurred";
    }

    return errorDescription;
  }

  static String _handleHttpResponse(http.Response response) {
    String errorDescription;
    switch (response.statusCode) {
      case 400:
        errorDescription = "400 Bad request: ${response.reasonPhrase}";
        break;
      case 401:
        errorDescription = "401 Unauthorized: ${response.reasonPhrase}";
        break;
      case 403:
        errorDescription = "403 Forbidden: ${response.reasonPhrase}";
        break;
      case 404:
        errorDescription = "404 Not found: ${response.reasonPhrase}";
        break;
      case 500:
      case 503:
        errorDescription = "500 Server error: ${response.reasonPhrase}";
        break;
      default:
        errorDescription = _parseErrorResponse(response);
    }
    return errorDescription;
  }

  static String _parseErrorResponse(http.Response response) {
    try {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final ErrorResponse errorResponse = ErrorResponse.fromJson(responseBody);

      if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
        return errorResponse.errors!.first.message ?? "Unknown error";
      } else {
        return "Failed to load data - status code: ${response.statusCode}";
      }
    } catch (e) {
      return "Failed to parse error response: ${e.toString()}";
    }
  }
}

class ErrorResponse {
  List<Errors>? _errors;

  List<Errors>? get errors => _errors;

  ErrorResponse({List<Errors>? errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      _errors = [];
      json["errors"].forEach((v) {
        _errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Errors {
  String? _code;
  String? _message;

  String? get code => _code;
  String? get message => _message;

  Errors({String? code, String? message}) {
    _code = code;
    _message = message;
  }

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
}
