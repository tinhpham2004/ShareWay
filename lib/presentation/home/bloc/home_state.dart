import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:location/location.dart';

part 'home_state.g.dart';

@CopyWith()
class HomeState {
  final bool isLoading;

  HomeState({
    this.isLoading = false,
  });
}
