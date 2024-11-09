import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/map/map_service.dart';
import 'package:share_way_frontend/data/api/map/request/autocomplete_request/autocomplete_request.dart';
import 'package:share_way_frontend/data/api/map/request/create_give_ride_request/create_give_ride_request.dart';
import 'package:share_way_frontend/data/api/map/request/create_hitch_ride_request/create_hitch_ride_request.dart';
import 'package:share_way_frontend/data/api/map/request/geocode_request/geocode_request.dart';
import 'package:share_way_frontend/domain/map/input/autocomplete_input.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete/autocomplete_output.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/map/output/geocode/geocode_output.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';

class MapRepository {
  final _service = MapService();

  Future<List<AutocompleteOutput>?> getAutocomplete(
      AutocompleteInput input) async {
    try {
      final response =
          await _service.getAutocomplete(AutocompleteRequest.toApiModel(input));
      if (response != null) {
        return response.data?.predictions
            ?.map((e) => AutocompleteOutput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<List<GeocodeOutput>?> getLocationFromGeocode(
      List<Geocode> input) async {
    try {
      final response = await _service
          .getLocationFromGeocode(GeocodeRequest.toApiModel(input));
      if (response != null) {
        return response.data?.results
            ?.map((e) => GeocodeOutput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<CreateGiveRideOutput?> createGiveRide(
      CreateGiveRideInput input) async {
    try {
      final response = await _service
          .createGiveRide(CreateGiveRideRequest.toApiModel(input));
      if (response != null) {
        return CreateGiveRideOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<String?> createHitchRide(CreateHitchRideInput input) async {
    try {
      final response = await _service
          .createHitchRide(CreateHitchRideRequest.toApiModel(input));
      if (response != null) {
        return response;
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<List<HitchRideRecommendationOuput>?> getHitchRideRecommendationList(
      String giveRideId) async {
    try {
      final response = await _service.suggestHitchRides(giveRideId);
      if (response != null) {
        return response.data?.rideRequests
            ?.map((e) => HitchRideRecommendationOuput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<List<GiveRideRecommendationOuput>?> getGiveRideRecommendationList(
      String hitchRideId) async {
    try {
      final response = await _service.suggestGiveRides(hitchRideId);
      if (response != null) {
        return response.data?.rideOffers
            ?.map((e) => GiveRideRecommendationOuput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }
}
