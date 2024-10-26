import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/map/map_service.dart';
import 'package:share_way_frontend/data/api/map/request/autocomplete_request/autocomplete_request.dart';
import 'package:share_way_frontend/domain/map/input/autocomplete_input.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete_output.dart';

class MapRepository {
  final _service = MapService();

  Future<List<AutocompleteOutput>?> getAutocomplete(AutocompleteInput input) async {
    try {
      final result = await _service.getAutocomplete(AutocompleteRequest.toApiModel(input));
      if (result != null) {
        return result.data?.predictions
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
}
