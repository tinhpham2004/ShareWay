import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/data/api/ride/response/history_ride_response/ride_history_response.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class HistoryRideOutput {
  final AppUser? user;
  final RideStatusEnum rideStatus;
  final double? distance;
  final int? duration;
  final int? fare;
  final DateTime? time;
  final List<String> waypoints;

  HistoryRideOutput({
    this.user,
    this.rideStatus = RideStatusEnum.CREATED,
    this.distance,
    this.duration,
    this.fare,
    this.time,
    this.waypoints = const [],
  });

  factory HistoryRideOutput.fromApiModel(
      {required RideHistoryResponse response, String? currentUserId}) {
    return HistoryRideOutput(
      user: currentUserId == response.driver?.userId
          ? AppUser(
              id: response.hitcher?.userId,
              fullName: response.hitcher?.fullName,
              avatarUrl: response.hitcher?.avatarUrl,
              averageRating: response.hitcher?.averageRating,
            )
          : AppUser(
              id: response.driver?.userId,
              fullName: response.driver?.fullName,
              avatarUrl: response.driver?.avatarUrl,
              averageRating: response.driver?.averageRating,
            ),
      rideStatus: RideStatusEnum.fromString(response.status ?? ''),
      distance: response.distance,
      duration: (response.duration != null)
          ? response.duration! ~/ 60 + (response.duration! % 60 == 0 ? 0 : 1)
          : null,
      fare: response.fare,
      time: DateTime.tryParse(response.endTime ?? ''),
      waypoints: [
        response.startAddress ?? '',
        ...response.waypoints?.map((e) => e.address ?? '').toList() ?? [],
        response.endAddress ?? '',
      ],
    );
  }
}
