import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/vehicle/vehicle_repository.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/manage_vehicle/bloc/manage_vehicle_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class ManageVehicleBloc extends Cubit<ManageVehicleState> {
  ManageVehicleBloc() : super(ManageVehicleState());

  final _vehicleRepository = VehicleRepository();

  void onStart(BuildContext context) {
    try {
      onFetchVehicles(context);
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

  void onAddVehicle(BuildContext context) {
    GoRouter.of(context).push(AppPath.addVehicle);
  }
}
