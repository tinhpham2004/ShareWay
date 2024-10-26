import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/home/bloc/home_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  void onStart(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      await onGetCurrentLocation(context);
    } catch (e) {
      // TODO: Add Home logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> onGetCurrentLocation(BuildContext context) async {
    Location location = Location();
    PermissionStatus permissionStatus = await location.requestPermission();
    if (permissionStatus == PermissionStatus.granted) {
      final currentLocation = await location.getLocation();
      emit(state.copyWith(currentLocation: currentLocation));
    } else {
      showErrorSnackbar(context, 'Xin hãy cho phép ứng dụng truy cập vị trí');
    }
  }

  void onGiveRidePressed(BuildContext context) {
    GoRouter.of(context).go(AppPath.giveRide);
  }

  void onHitchRidePressed(BuildContext context) {
    GoRouter.of(context).go(AppPath.hitchRide);
  }
}
