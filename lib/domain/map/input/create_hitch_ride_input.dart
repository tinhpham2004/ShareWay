import 'package:share_way_frontend/domain/shared/models/option_item.dart';

class CreateHitchRideInput {
  final List<OptionItem>? locationList;
  final DateTime? startTime;

  CreateHitchRideInput({this.locationList, this.startTime});
}
