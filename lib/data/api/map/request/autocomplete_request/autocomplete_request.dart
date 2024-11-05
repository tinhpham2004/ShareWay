import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/map/input/autocomplete_input.dart';

part 'autocomplete_request.g.dart';

@JsonSerializable()
class AutocompleteRequest {
  String input;
  int? limit;
  String? location;
  int? radius;
  @JsonKey(name: 'more_compound')
  bool? moreCompound;
  @JsonKey(name: 'current_location')
  String? currentLocation;

  AutocompleteRequest({
    required this.input,
    this.limit,
    this.location,
    this.moreCompound,
    this.currentLocation,
  });

  Map<String, dynamic> toJson() => _$AutocompleteRequestToJson(this);

  factory AutocompleteRequest.toApiModel(AutocompleteInput input) {
    return AutocompleteRequest(
      input: input.input,
      limit: input.limit,
      location: input.location,
      moreCompound: input.moreCompound,
      currentLocation: input.currentLocation,
    );
  }
}
