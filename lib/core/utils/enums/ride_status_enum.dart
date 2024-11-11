import 'package:flutter_screenutil/flutter_screenutil.dart';

enum RideStatusEnum {
  CREATED,
  RECEIVING,
  SENDING,
  ACCEPTED,
  ONGOING,
  COMPLETED,
  CANCELLED;

  String? get getPrimaryButtonTitle {
    switch (this) {
      case RideStatusEnum.CREATED:
        return 'Mời đi cùng';
      case RideStatusEnum.RECEIVING:
        return 'Đồng ý';
      case RideStatusEnum.SENDING:
        return 'Gỡ lời mời';
      case RideStatusEnum.ACCEPTED:
        return 'Bắt đầu chuyến đi';
      case RideStatusEnum.ONGOING:
        return 'Hoàn thành';
      case RideStatusEnum.COMPLETED:
        return null;
      case RideStatusEnum.CANCELLED:
        return null;
      default:
        return null;
    }
  }

  String? get getSecondaryButtonTitle {
    switch (this) {
      case RideStatusEnum.CREATED:
        return null;
      case RideStatusEnum.RECEIVING:
        return 'Từ chối';
      case RideStatusEnum.SENDING:
        return null;
      case RideStatusEnum.ACCEPTED:
        return 'Hủy chuyến';
      case RideStatusEnum.ONGOING:
        return 'Hủy chuyến';
      case RideStatusEnum.COMPLETED:
        return null;
      case RideStatusEnum.CANCELLED:
        return null;
      default:
        return null;
    }
  }

  double get getDiffHeight {
    if (getPrimaryButtonTitle != null) {
      if (getSecondaryButtonTitle != null) {
        return 0.1.sh;
      } else {
        return 0.0;
      }
    } else {
      return -0.1.sh;
    }
  }
}
