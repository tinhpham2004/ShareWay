import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/onboarding/bloc/onboarding_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class OnboardingBloc extends Cubit<OnboardingState> {
  OnboardingBloc() : super(OnboardingState());

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {
      // TODO: Add onboarding logic
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onLoginPressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.auth, extra: AppPath.login);
  }

  void onStartPressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.auth, extra: AppPath.signUp);
  }
}
