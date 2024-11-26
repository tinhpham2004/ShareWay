import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  void onStart(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      // TODO: Add Home logic
    } catch (e) {
      // TODO: Add Home logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onGiveRidePressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.giveRidePickLocation);
  }

  void onHitchRidePressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.hitchRidePickLocation);
  }

  void onPendingRidePressed(BuildContext context) {
    GoRouter.of(context).push(AppPath.pendingRide);
  }
}
