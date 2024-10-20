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
    final phoneNumberController = TextEditingController();
    emit(
      state.copyWith(
        phoneNumberController: phoneNumberController,
        path: path,
      ),
    );
  }

  void onChangePhoneNumber(String? value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void onClearData() {
    state.phoneNumberController!.clear();
  }

  void onValidatePhoneNumber(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
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
        final response = await _authRepository.initRegister(state.phoneNumber!);
        if (response) {
          final authData = AuthData(
            phoneNumber: state.phoneNumber!,
            path: state.path!,
            email: state.email,
            name: state.displayName,
          );
          GoRouter.of(context).push(AppPath.otp, extra: authData);
        } else {
          showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        }
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onGoogleSignIn(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _googleAuthRepository.signInWithGoogle();
      onGetUserInfo(context);

      if (state.email == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }

      if (state.path == AppPath.login) {
        final response = await _authRepository.loginOauth(state.email!);
        if (response != null) {
          final authData = AuthData(
            phoneNumber: response.phoneNumber!,
            path: state.path!,
            email: state.email,
            name: state.displayName,
            userId: response.userId,
          );
          GoRouter.of(context).push(
            AppPath.otp,
            extra: authData,
          );
        }
      } else if (state.path == AppPath.signUp) {
        showSuccessSnackbar(context,
            'Đăng ký tài khoản bằng Google thành công!\nVui lòng nhập số điện thoại để tiếp tục');
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
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
