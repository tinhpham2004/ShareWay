import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_complete/bloc/hitch_ride_complete_state.dart';

class HitchRideCompleteBloc extends Cubit<HitchRideCompleteState> {
  HitchRideCompleteBloc() : super(HitchRideCompleteState());

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
