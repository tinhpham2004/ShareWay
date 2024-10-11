import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/google_auth/google_auth_repository.dart';
import 'package:share_way_frontend/presentation/auth/bloc/auth_state.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/router/app_path.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState());

  final _googleAuthRepository = GoogleAuthRepository();

  void onStart({required BuildContext context, required String path}) {
    try {
      final phoneNumberController = TextEditingController();
      emit(
        state.copyWith(
          phoneNumberController: phoneNumberController,
          path: path,
        ),
      );
    } catch (e) {
      showErrorSnackbar(context, e.toString());
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

  void onValidatePhoneNumber(BuildContext context) {
    final nonNumericRegExp = RegExp(r'[^0-9]');
    final isValid = state.phoneNumberController!.text.isNotEmpty &&
        !nonNumericRegExp.hasMatch(
            state.phoneNumberController!.text.replaceAll(RegExp(r' '), ''));

    if (isValid) {
      GoRouter.of(context).push(
        AppPath.otp,
        extra: AuthData(
          phoneNumber: state.phoneNumber!,
          path: state.path!,
        ),
      );
    }
    final errorText = isValid ? null : 'Số điện thoại không đúng định dạng';
    emit(
      state.copyWith(errorText: errorText),
    );
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
