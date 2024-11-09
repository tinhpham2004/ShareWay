import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/input/create_hitch_ride_input.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_pick_time/bloc/hitch_ride_pick_time_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HitchRidePickTimeBloc extends Cubit<HitchRidePickTimeState> {
  HitchRidePickTimeBloc() : super(HitchRidePickTimeState());

  final _mapRepository = MapRepository();

  void onStart(CreateHitchRideInput data) {
    emit(state.copyWith(isLoading: true));
    try {
      final timeList = [
        'Tạo chuyến đi ngay lập tức',
        'Hẹn giờ cho chuyến đi',
      ];
      emit(state.copyWith(
        createHitchRideInput: data,
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
    print(state.selectedDateTime);
  }

  void onConfirm(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = CreateHitchRideInput(
        locationList: state.createHitchRideInput?.locationList,
        startTime: state.selectedRadioIndex == 0
            ? DateTime.now()
            : state.selectedDateTime ?? DateTime.now(),
      );

      final response = await _mapRepository.createHitchRide(data);

      if (response == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }

      GoRouter.of(context).go(AppPath.hitchRideReccomendation, extra: response);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
