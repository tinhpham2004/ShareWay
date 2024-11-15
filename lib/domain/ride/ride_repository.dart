import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/ride/request/cancel_ride_request/cancel_ride_request.dart';
import 'package:share_way_frontend/data/api/ride/request/matched_ride_request/matched_ride_request.dart';
import 'package:share_way_frontend/data/api/ride/request/ride_request/ride_request.dart';
import 'package:share_way_frontend/data/api/ride/ride_service.dart';
import 'package:share_way_frontend/domain/ride/input/cancel_ride_input.dart';
import 'package:share_way_frontend/domain/ride/input/matched_ride_input.dart';
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
      final result = await _service.sendGiveRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<String?> acceptHitchRide(RideRequestInput input) async {
    try {
      final result =
          await _service.acceptHitchRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<String?> acceptGiveRide(RideRequestInput input) async {
    try {
      final result =
          await _service.acceptGiveRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<bool> cancelHitchRide(RideRequestInput input) async {
    try {
      final result =
          await _service.cancelHitchRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<bool> cancelGiveRide(RideRequestInput input) async {
    try {
      final result =
          await _service.cancelGiveRide(RideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<bool> startRide(MatchedRideInput input) async {
    try {
      final result =
          await _service.startRide(MatchedRideRequest.toApiModel(input));
      return result != null;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<void> updateRideLocation(MatchedRideInput input) async {
    try {
      final result = await _service
          .updateRideLocation(MatchedRideRequest.toApiModel(input));
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
  }

  Future<bool> endRide(MatchedRideInput input) async {
    try {
      final result =
          await _service.endRide(MatchedRideRequest.toApiModel(input));
      return result != null;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }

  Future<bool> cancelRide(CancelRideInput input) async {
    try {
      final result =
          await _service.cancelRide(CancelRideRequest.toApiModel(input));
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return false;
  }
}
