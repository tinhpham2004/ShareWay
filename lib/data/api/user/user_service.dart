import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';

class UserService {
  final _service = ApiService();

  Future<UserResponse?> getProfile() async {
    final response = await _service.get(
      UserApi.getProfile,
      fromJson: (json) => UserResponse.fromJson(json['data']['user']),
    );
    return response;
  }

  Future<bool> registerDeviceToken(String deviceToken) async {
    final response = await _service.post(
      UserApi.registerDeviceToken,
      data: {'device_token': deviceToken},
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }
}
