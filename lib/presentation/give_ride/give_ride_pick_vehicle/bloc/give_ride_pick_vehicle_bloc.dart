import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/domain/vehicle/vehicle_repository.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_vehicle/bloc/give_ride_pick_vehicle_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class GiveRidePickVehicleBloc extends Cubit<GiveRidePickVehicleState> {
  GiveRidePickVehicleBloc() : super(GiveRidePickVehicleState());

  final _vehicleRepository = VehicleRepository();
  final _mapRepository = MapRepository();

  void onStart(
      {required BuildContext context, required CreateGiveRideInput data}) {
    try {
      onFetchVehicles(context);
      emit(state.copyWith(createGiveRideInput: data));
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchVehicles(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final vehicles = await _vehicleRepository.getUserVehicle();
      if (vehicles != null) {
        emit(state.copyWith(vehicles: vehicles));
      } else {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSelectVehicle(int index) {
    emit(state.copyWith(selectedVehicleIndex: index));
  }

  void onConfirm(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final input = CreateGiveRideInput(
        locationList: state.createGiveRideInput?.locationList,
        startTime: state.createGiveRideInput?.startTime,
        vehicleId: state.vehicles[state.selectedVehicleIndex].vehicleId,
      );

      final response = await _mapRepository.createGiveRide(input);

      if (response == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }

      GoRouter.of(context).push(AppPath.giveRidePreview, extra: response);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
