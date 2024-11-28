import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class PendingRideBloc extends Cubit<PendingRideState> {
  PendingRideBloc() : super(PendingRideState());

  final _rideRepository = RideRepository();

  void onStart({required BuildContext context}) {
    try {
      onFetchPendingRide(context);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    }
  }

  void onFetchPendingRide(BuildContext context) async {
    emit(state.copyWith(isLoading: true, dataChange: !state.dataChange));
    final response = await _rideRepository.getAllPendingRide();

    if (response == null) {
      emit(state.copyWith(isLoading: false, dataChange: !state.dataChange));
      return;
    }

    emit(state.copyWith(
      pendingRideRequest: response.pendingRideRequest,
      pendingRideOffer: response.pendingRideOffer,
      isLoading: false,
      dataChange: !state.dataChange,
    ));
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onChangeSelectedButtonIndex(int index) {
    emit(
      state.copyWith(
        selectedButtonIndex: index,
      ),
    );
  }

  void onSelectHitchRide(
      {required BuildContext context, required int selectedIndex}) {
    GoRouter.of(context).push(
      AppPath.hitchRideReccomendation,
      extra: state.pendingRideRequest[selectedIndex].hitchRideId,
    );
  }

  void onSelectGiveRide(
      {required BuildContext context, required int selectedIndex}) {
    final data = CreateGiveRideOutput(
      giveRideId: state.pendingRideOffer[selectedIndex].giveRideId,
      vehicleId: state.pendingRideOffer[selectedIndex].vehicle?.vehicleId,
    );
    GoRouter.of(context).push(
      AppPath.giveRideRecommendation,
      extra: data,
    );
  }
}
