import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/auth/input/verify_login_otp_input.dart';
import 'package:share_way_frontend/domain/auth/input/verify_register_otp_input.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/auth/auth_repository.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/otp/bloc/otp_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class OtpBloc extends Cubit<OtpState> {
  OtpBloc() : super(OtpState());

  final _authRepository = AuthRepository();
  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void onStart(AuthData authData) {
    try {
      final List<int> otpCode = List.filled(6, -1);
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (state.remainingTime > 0) {
          emit(state.copyWith(remainingTime: state.remainingTime - 1));
        } else {
          emit(state.copyWith(errorText: 'Mã xác thực đã quá hạn'));
          timer.cancel();
        }
      });
      emit(
        state.copyWith(
          authData: authData,
          otpCode: otpCode,
        ),
      );
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      // TODO: Add onboarding logic
    }
  }

  void onOtpChanged({
    required BuildContext context,
    required int index,
    required int? value,
  }) {
    var otpCode = List<int>.from(state.otpCode ?? []);
    otpCode[index] = value ?? -1;
    emit(state.copyWith(otpCode: otpCode));

    if (index == 5) {
      onValidateOtp(context);
    } else {
      if (value != null) {
        FocusScope.of(context).nextFocus();
      } else if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
  }

  void onValidateOtp(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      final otpCode = state.otpCode ?? [];
      if (otpCode.contains(-1)) {
        emit(state.copyWith(errorText: 'Mã xác thực không đúng'));
        return;
      }

      switch (state.authData?.path) {
        case AppPath.login:
          final input = VerifyLoginOtpInput(
            phoneNumber: state.authData!.phoneNumber,
            otp: otpCode.join(),
            userId: state.authData!.userId,
          );
          final response = await _authRepository.verifyLoginOtp(input);
          if (response != null) {
            await Preferences.saveToken(
              accessToken: response.accessToken!,
              refreshToken: response.refreshToken!,
            );
            await Preferences.clearAuthData();
            GoRouter.of(context).go(AppPath.home, extra: response.appUser);
          }
          break;
        case AppPath.signUp:
          final input = VerifyRegisterOtpInput(
            phoneNumber: state.authData!.phoneNumber,
            otp: otpCode.join(),
          );
          final response = await _authRepository.verifyRegisterOtp(input);
          if (response) {
            await Preferences.saveAuthData(state.authData!);
            GoRouter.of(context).push(
              AppPath.signUpName,
              extra: state.authData,
            );
          }
          break;
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onResendOtp() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response =
          await _authRepository.resendOtp(state.authData!.phoneNumber);
      if (!response) {
        emit(state.copyWith(errorText: 'Đã có lỗi xảy ra'));
        return;
      }
      emit(state.copyWith(remainingTime: 60, errorText: null));
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (state.remainingTime > 0) {
          emit(state.copyWith(remainingTime: state.remainingTime - 1));
        } else {
          emit(state.copyWith(errorText: 'Mã xác thực đã quá hạn'));
          timer.cancel();
        }
      });
    } catch (e) {
      emit(state.copyWith(errorText: 'Đã có lỗi xảy ra'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
