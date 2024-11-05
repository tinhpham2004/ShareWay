import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/map/response/autocomplete_response/autocomplete_prediction_response.dart';
part 'autocomplete_output.g.dart';

@CopyWith()
class AutocompleteOutput {
  final String? placeId;
  final String? description;
  final String? mainText;
  final String? secondaryText;
  final double? distance;

  AutocompleteOutput({
    this.placeId,
    this.description,
    this.mainText,
    this.secondaryText,
    this.distance,
  });

  factory AutocompleteOutput.fromApiModel(
      AutocompletePredictionResponse response) {
    return AutocompleteOutput(
      placeId: response.placeId,
      description: response.description,
      mainText: response.structuredFormatting?.mainText,
      secondaryText: response.structuredFormatting?.secondaryText,
      distance: response.distance,
    );
  }
}
