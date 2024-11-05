import 'package:share_way_frontend/domain/shared/models/option_item.dart';

class CreateGiveRideInput {
  final List<OptionItem>? locationList;
  final DateTime? startTime;
  final String? vehicleId;

  CreateGiveRideInput({this.locationList, this.startTime, this.vehicleId});
}
