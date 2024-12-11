import 'package:flutter_screenutil/flutter_screenutil.dart';

enum RideStatusEnum {
  CREATED,
  RECEIVING,
  SENDING,
  ACCEPTED,
  ONGOING,
  COMPLETED,
  CANCELLED;

  static RideStatusEnum fromString(String value) {
    switch (value) {
      case 'created':
        return RideStatusEnum.CREATED;
      case 'receiving':
        return RideStatusEnum.RECEIVING;
      case 'sending':
        return RideStatusEnum.SENDING;
      case 'accepted':
        return RideStatusEnum.ACCEPTED;
      case 'ongoing':
        return RideStatusEnum.ONGOING;
      case 'completed':
        return RideStatusEnum.COMPLETED;
      case 'cancelled':
        return RideStatusEnum.CANCELLED;
      default:
        return RideStatusEnum.CREATED;
    }
  }

  @override
  String toString() {
    switch (this) {
      case RideStatusEnum.CREATED:
        return 'Mới tạo';
      case RideStatusEnum.RECEIVING:
        return 'Đang nhận';
      case RideStatusEnum.SENDING:
        return 'Đang gửi';
      case RideStatusEnum.ACCEPTED:
        return 'Đã chấp nhận';
      case RideStatusEnum.ONGOING:
        return 'Đang đi';
      case RideStatusEnum.COMPLETED:
        return 'Hoàn thành';
      case RideStatusEnum.CANCELLED:
        return 'Đã hủy';
    }
  }

  String? get getGiveRidePrimaryButtonTitle {
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

  String? get getGiveRideSecondaryButtonTitle {
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

  String? get getHitchRidePrimaryButtonTitle {
    switch (this) {
      case RideStatusEnum.CREATED:
        return 'Mời đi cùng';
      case RideStatusEnum.RECEIVING:
        return 'Đồng ý';
      case RideStatusEnum.SENDING:
        return 'Gỡ lời mời';
      case RideStatusEnum.ACCEPTED:
        return 'Hủy chuyến';
      case RideStatusEnum.ONGOING:
        return null;
      case RideStatusEnum.COMPLETED:
        return null;
      case RideStatusEnum.CANCELLED:
        return null;
      default:
        return null;
    }
  }

  String? get getHitchRideSecondaryButtonTitle {
    switch (this) {
      case RideStatusEnum.CREATED:
        return null;
      case RideStatusEnum.RECEIVING:
        return 'Từ chối';
      case RideStatusEnum.SENDING:
        return null;
      case RideStatusEnum.ACCEPTED:
        return null;
      case RideStatusEnum.ONGOING:
        return null;
      case RideStatusEnum.COMPLETED:
        return null;
      case RideStatusEnum.CANCELLED:
        return null;
      default:
        return null;
    }
  }

  double get getGiveRideDiffHeight {
    if (getGiveRidePrimaryButtonTitle != null) {
      if (getGiveRideSecondaryButtonTitle != null) {
        return 0.1.sh;
      } else {
        return 0.0;
      }
    } else {
      return -0.1.sh;
    }
  }

  double get getHitchRideDiffHeight {
    if (this == RideStatusEnum.ACCEPTED) {
      return 0.07.sh;
    }
    if (getHitchRidePrimaryButtonTitle != null) {
      if (getHitchRideSecondaryButtonTitle != null) {
        return 0.11.sh;
      } else {
        return 0.0;
      }
    } else {
      return -0.1.sh;
    }
  }
}
