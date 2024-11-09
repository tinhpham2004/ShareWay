import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete/autocomplete_output.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';

part 'hitch_ride_pick_location_state.g.dart';

@CopyWith()
class HitchRidePickLocationState {
  final bool isLoading;
  final List<OptionItem> locationList;
  final bool dataChange;
  final int selectedButtonIndex;
  final List<AutocompleteOutput> autocompleteList;
  final int? edittingIndex;

  HitchRidePickLocationState({
    this.isLoading = false,
    this.locationList = const [],
    this.dataChange = false,
    this.selectedButtonIndex = 0,
    this.autocompleteList = const [],
    this.edittingIndex,
  });
}
