import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/auth/auth_repository.dart';
import 'package:share_way_frontend/domain/google_auth/google_auth_repository.dart';
import 'package:share_way_frontend/presentation/auth/bloc/auth_state.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/router/app_path.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState());

  final _googleAuthRepository = GoogleAuthRepository();
  final _authRepository = AuthRepository();

  void onStart(String path) {
    try {
      final phoneNumberController = TextEditingController();
      emit(
        state.copyWith(
          phoneNumberController: phoneNumberController,
          path: path,
        ),
      );
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      // TODO: Add onboarding logic
    }
  }

  void onChangePhoneNumber(String? value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void onClearData() {
    state.phoneNumberController!.clear();
  }

  void onValidatePhoneNumber(BuildContext context) async {
    final nonNumericRegExp = RegExp(r'[^0-9]');
    final isValid = state.phoneNumberController!.text.isNotEmpty &&
        !nonNumericRegExp.hasMatch(
            state.phoneNumberController!.text.replaceAll(RegExp(r' '), ''));

    if (!isValid) {
      emit(state.copyWith(errorText: 'Số điện thoại không đúng định dạng'));
      return;
    }

    emit(state.copyWith(errorText: null));

    if (state.path == AppPath.login) {
      final response = await _authRepository.loginPhone(state.phoneNumber!);
      if (response != null) {
        final authData = AuthData(
          phoneNumber: state.phoneNumber!,
          path: state.path!,
          email: state.email,
          name: state.displayName,
          userId: response,
        );
        GoRouter.of(context).push(AppPath.otp, extra: authData);
      } else {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      }
    } else if (state.path == AppPath.signUp) {
      final authData = AuthData(
        phoneNumber: state.phoneNumber!,
        path: state.path!,
        email: state.email,
        name: state.displayName,
      );
      GoRouter.of(context).push(AppPath.otp, extra: authData);
      final response = await _authRepository.initRegister(state.phoneNumber!);
      if (!response) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      }
    }
  }

  void onGooleSignIn(BuildContext context) async {
    try {
      await _googleAuthRepository.signInWithGoogle();
      showSuccessSnackbar(context, 'Đăng nhập thành công');
      onGetUserInfo(context);
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    } finally {}
  }

  void onGoogleSignOut(BuildContext context) async {
    try {
      await _googleAuthRepository.signOut();
      showSuccessSnackbar(context, 'Đăng xuất thành công');
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    } finally {}
  }

  void onGetUserInfo(BuildContext context) {
    try {
      User? user = _googleAuthRepository.getCurrentUser();
      emit(
        state.copyWith(
          email: user?.email,
          displayName: user?.displayName,
        ),
      );
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    } finally {}
  }
}
