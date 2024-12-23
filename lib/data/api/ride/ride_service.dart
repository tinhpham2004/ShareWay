import 'dart:convert';

import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/ride/request/cancel_ride_request/cancel_ride_request.dart';
import 'package:share_way_frontend/data/api/ride/request/matched_ride_request/matched_ride_request.dart';
import 'package:share_way_frontend/data/api/ride/request/rating_driver_request/rating_driver_request.dart';
import 'package:share_way_frontend/data/api/ride/request/rating_hitcher_request/rating_hitcher_request.dart';
import 'package:share_way_frontend/data/api/ride/request/ride_request/ride_request.dart';
import 'package:share_way_frontend/data/api/ride/response/history_ride_response/history_ride_response.dart';
import 'package:share_way_frontend/data/api/ride/response/match_ride_response/match_ride_response.dart';
import 'package:share_way_frontend/data/api/ride/response/pending_ride_response/pending_ride_response.dart';

class RideService {
  final _service = ApiService();

  Future<bool> sendHitchRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.hitchRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<bool> sendGiveRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.givehRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<String?> acceptHitchRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.acceptHitchRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['data']['ride_id'],
    );
    return response;
  }

  Future<String?> acceptGiveRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.acceptGiveRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['data']['ride_id'],
    );
    return response;
  }

  Future<bool> cancelHitchRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.cancelHitchRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<bool> cancelGiveRide(RideRequest request) async {
    final response = await _service.post(
      RideApi.cancelGiveRideRequest,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<MatchRideResponse?> startRide(MatchedRideRequest request) async {
    final response = await _service.post(
      RideApi.startRide,
      data: request.toJson(),
      fromJson: (json) => MatchRideResponse.fromJson(json),
    );
    return response;
  }

  Future<MatchRideResponse?> updateRideLocation(
      MatchedRideRequest request) async {
    final response = await _service.post(
      RideApi.updateRideLocation,
      data: request.toJson(),
      fromJson: (json) => MatchRideResponse.fromJson(json),
    );
    return response;
  }

  Future<MatchRideResponse?> endRide(MatchedRideRequest request) async {
    final response = await _service.post(
      RideApi.endRide,
      data: request.toJson(),
      fromJson: (json) => MatchRideResponse.fromJson(json),
    );
    return response;
  }

  Future<bool> cancelRide(CancelRideRequest request) async {
    final response = await _service.post(
      RideApi.cancelRide,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<PendingRideResponse?> getAllPendingRide() async {
    final response = await _service.get(
      RideApi.getAllPendingRide,
      fromJson: (json) => PendingRideResponse.fromJson(json),
    );
    return response;
  }

  Future<bool> ratingRideHitcher(RatingHitcherRequest request) async {
    final response = await _service.post(
      RideApi.ratingRideHitcher,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<bool> ratingRideDriver(RatingDriverRequest request) async {
    final response = await _service.post(
      RideApi.ratingRideDriver,
      data: request.toJson(),
      fromJson: (json) => json['success'] ?? false,
    );
    return response;
  }

  Future<HistoryRideResponse?> getRideHistory() async {
    final response = await _service.get(
      RideApi.getRideHistory,
      fromJson: (json) => HistoryRideResponse.fromJson(json),
    );
    return response;
  }
}
