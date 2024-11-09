import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/ride/request/ride_request.dart';
import 'package:share_way_frontend/data/api/ride/ride_service.dart';
import 'package:share_way_frontend/domain/ride/input/ride_request_input.dart';

class RideRepository {
  final _service = RideService();

  Future<bool> sendHitchRide(RideRequestInput input) async {
    try {
      final result =
          await _service.sendHitchRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<bool> sendGiveRide(RideRequestInput input) async {
    try {
      final result =
          await _service.sendGiveRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }
}
