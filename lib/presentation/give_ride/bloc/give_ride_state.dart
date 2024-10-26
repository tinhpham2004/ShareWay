import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete_output.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';

part 'give_ride_state.g.dart';

@CopyWith()
class GiveRideState {
  final bool isLoading;
  final List<OptionItem> locationList;
  final bool dataChange;
  final int selectedButtonIndex;
  final List<AutocompleteOutput> autocompleteList;
  final int? edittingIndex;

  GiveRideState({
    this.isLoading = false,
    this.locationList = const [],
    this.dataChange = false,
    this.selectedButtonIndex = 0,
    this.autocompleteList = const [],
    this.edittingIndex,
  });
}
