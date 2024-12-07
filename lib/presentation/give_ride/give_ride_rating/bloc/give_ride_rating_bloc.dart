import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_state.dart';

class GiveRideRatingBloc extends Cubit<GiveRideRatingState> {
  GiveRideRatingBloc() : super(GiveRideRatingState());

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
