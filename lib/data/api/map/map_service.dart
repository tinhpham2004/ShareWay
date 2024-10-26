
import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/map/request/autocomplete_request/autocomplete_request.dart';
import 'package:share_way_frontend/data/api/map/response/autocomplete_response/autocomplete_response.dart';

class MapService {
  final _service = ApiService();

  Future<AutocompleteResponse?> getAutocomplete(AutocompleteRequest request) async {
    final response = await _service.get(
      MapApi.autocomplete,
      params: request.toJson(),
      fromJson: (json) => AutocompleteResponse.fromJson(json),
    );
    return response;
  }
}
