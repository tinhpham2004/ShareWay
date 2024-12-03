import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/payment/payment_service.dart';

class PaymentRepository {
  final _service = PaymentService();

  Future<String?> linkMomoWallet(String walletPhoneNumber) async {
    try {
      final result = await _service
          .linkMomoWallet(walletPhoneNumber);

      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }
}
