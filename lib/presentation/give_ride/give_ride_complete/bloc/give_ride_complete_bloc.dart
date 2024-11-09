import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_complete/bloc/give_ride_complete_state.dart';

class GiveRideCompleteBloc extends Cubit<GiveRideCompleteState> {
  GiveRideCompleteBloc() : super(GiveRideCompleteState());

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {} catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
