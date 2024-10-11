import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/otp/bloc/otp_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class OtpBloc extends Cubit<OtpState> {
  OtpBloc() : super(OtpState());

  void onStart({required BuildContext context, required AuthData authData}) {
    try {
      final List<int> otpCode = List.filled(6, -1);
      Timer.periodic(Duration(seconds: 1), (Timer timer) {
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
      showErrorSnackbar(context, e.toString());
    } finally {
      // TODO: Add onboarding logic
    }
  }

  void onOtpChanged(
      {required BuildContext context,
      required int index,
      required int? value}) {
    var otpCode = List<int>.from(state.otpCode ?? []);
    otpCode[index] = value ?? -1;
    emit(
      state.copyWith(
        otpCode: otpCode,
      ),
    );
    if (index == 5) {
      onValidateOtp(context);
    }
    if (value != null && index < 5) {
      FocusScope.of(context).nextFocus();
    }
    if (value == null && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  void onValidateOtp(BuildContext context) {
    if ((state.otpCode ?? []).contains(-1)) {
      emit(state.copyWith(errorText: 'Mã xác thực không đúng'));
    } else {
      if (state.authData?.path == AppPath.login) {
        GoRouter.of(context).go(AppPath.home);
      } else {
        GoRouter.of(context).push(AppPath.signUpName);
      }
    }
  }
}
