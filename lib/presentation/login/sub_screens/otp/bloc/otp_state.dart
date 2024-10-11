import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';

part 'otp_state.g.dart';

@CopyWith()
class OtpState {
  final int remainingTime;
  final String? phoneNumber;
  final List<int>? otpCode;
  final String? errorText;
  bool get isOtpValid {
    return errorText == null;
  }

  String get formattedTime {
    int minutes = (remainingTime / 60).floor();
    int seconds = remainingTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  OtpState({
    this.remainingTime = 600,
    this.phoneNumber,
    this.otpCode,
    this.errorText,
  });
}
