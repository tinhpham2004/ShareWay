import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';

part 'otp_state.g.dart';

@CopyWith()
class OtpState {
  final bool isLoading;
  final int remainingTime;
  final AuthData? authData;
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
    this.isLoading = false,
    this.remainingTime = 60,
    this.authData,
    this.otpCode,
    this.errorText,
  });
}
