import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';

class PaymentService {
  final _service = ApiService();

  Future<String?> linkMomoWallet(String walletPhoneNumber) async {
    final response = await _service.post(
      PaymentApi.linkMomoWallet,
      data: {'walletPhoneNumber': walletPhoneNumber},
      fromJson: (json) => json['data']['deeplink'],
    );
    return response;
  }
}
