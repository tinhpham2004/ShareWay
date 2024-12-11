import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/presentation/activity/bloc/activity_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class ActivityBloc extends Cubit<ActivityState> {
  ActivityBloc() : super(ActivityState());

  final _rideRepository = RideRepository();

  void onStart({required BuildContext context}) {
    try {
      onFetchHistoryRide(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onFetchHistoryRide(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final response = await _rideRepository.getHistoryRide();

    if(response == null) {
      showErrorSnackbar(context, 'Có lỗi xảy ra, vui lòng thử lại sau');
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(state.copyWith(rideList: response, isLoading: false));
  }
}
