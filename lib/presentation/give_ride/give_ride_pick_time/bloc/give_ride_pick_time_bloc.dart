import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_time/bloc/give_ride_pick_time_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class GiveRidePickTimeBloc extends Cubit<GiveRidePickTimeState> {
  GiveRidePickTimeBloc() : super(GiveRidePickTimeState());

  void onStart(CreateGiveRideInput data) {
    emit(state.copyWith(isLoading: true));
    try {
      final timeList = [
        'Tạo chuyến đi ngay lập tức',
        'Hẹn giờ cho chuyến đi',
      ];
      emit(state.copyWith(
        createGiveRideInput: data,
        timeList: timeList,
      ));
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSelectRadioIndex(int index) {
    emit(state.copyWith(selectedRadioIndex: index));
  }

  void onSelectDateTime({required bool isDate, required DateTime dateTime}) {
    if (isDate) {
      emit(state.copyWith(selectedDateTime: dateTime));
    } else {
      emit(state.copyWith(
          selectedDateTime: state.selectedDateTime?.copyWith(
        hour: dateTime.hour,
        minute: dateTime.minute,
      )));
    }
  }

  void onConfirm(BuildContext context) {
    final data = CreateGiveRideInput(
      locationList: state.createGiveRideInput?.locationList,
      startTime: state.selectedRadioIndex == 0
          ? DateTime.now()
          : state.selectedDateTime ?? DateTime.now(),
    );

    GoRouter.of(context).push(AppPath.giveRidePickVehicle, extra: data);
  }
}
