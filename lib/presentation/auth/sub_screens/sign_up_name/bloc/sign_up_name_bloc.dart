import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/auth/auth_repository.dart';
import 'package:share_way_frontend/domain/auth/input/register_input.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/sign_up_name/bloc/sign_up_name_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class SignUpNameBloc extends Cubit<SignUpNameState> {
  SignUpNameBloc() : super(SignUpNameState());

  final _authRepository = AuthRepository();

  void onStart(AuthData authData) {
    try {
      emit(state.copyWith(authData: authData));
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      // TODO: Add onboarding logic
    }
  }

  void onChangeName(String? value) {
    emit(state.copyWith(name: value));
  }

  void onContinueButtonPressed(BuildContext context) async {
    try {
      final input = RegisterInput(
        fullName: state.name,
        phoneNumber: state.authData!.phoneNumber,
        email: state.authData!.email,
      );
      final userId = await _authRepository.register(input);
      if (userId != null) {
        await Preferences.saveAuthData(
          state.authData!.copyWith(
            name: state.name,
            userId: userId,
          ),
        );
        GoRouter.of(context).push(
          AppPath.verifyIdCard,
          extra: state.authData!.copyWith(
            name: state.name,
            userId: userId,
          ),
        );
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    }
  }
}
