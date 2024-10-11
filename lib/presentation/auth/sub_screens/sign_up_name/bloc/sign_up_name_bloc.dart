import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/sign_up_name/bloc/sign_up_name_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class SignUpNameBloc extends Cubit<SignUpNameState> {
  SignUpNameBloc() : super(SignUpNameState());

  void onStart({required BuildContext context}) {
    try {
      // TODO: Add onboarding logic
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    } finally {
      // TODO: Add onboarding logic
    }
  }

  void onChangeName(String? value) {
    emit(state.copyWith(name: value));
  }

  void onContinueButtonPressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.verifyIdCard);
  }
}
