// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/vehicle/input/register_vehicle_input.dart';
import 'package:share_way_frontend/domain/vehicle/input/vehicles_input.dart';
import 'package:share_way_frontend/domain/vehicle/vehicle_repository.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/bloc/add_vehicle_state.dart';

class AddVehicleBloc extends Cubit<AddVehicleState> {
  AddVehicleBloc() : super(AddVehicleState());

  final _vehicleRepository = VehicleRepository();

  void onStart(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {} catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchVehicles({
    required BuildContext context,
    String? vehicleName,
    int? pageKey,
  }) async {
    if (!state.hasMoreData) return;

    try {
      final input = VehiclesInput(
        page: pageKey ?? state.pageKey,
        limit: state.pageSize,
        vehicleName: vehicleName,
      );
      final newVehicles = await _vehicleRepository.getVehicles(input);
      if (newVehicles == null) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }
      final isLastPage =
          (newVehicles.isNotEmpty && newVehicles.length < state.pageSize);
      emit(state.copyWith(
        vehicles: (pageKey ?? state.pageKey) == 1
            ? newVehicles
            : (List.of(state.vehicles)..addAll(newVehicles)),
        pageKey: (pageKey ?? state.pageKey) + 1,
        hasMoreData: !isLastPage,
      ));
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {}
  }

  void onChangeData({
    String? licensePlate,
    String? cavetNumber,
  }) {
    emit(state.copyWith(
      licensePlate: licensePlate ?? state.licensePlate,
      cavetNumber: cavetNumber ?? state.cavetNumber,
    ));
  }

  void onChangeVehicle(OptionItem? selectedVehicle) {
    emit(state.copyWith(
        selectedVehicle: selectedVehicle, dataChange: !state.dataChange));
  }

  void onSave(BuildContext context) async {
    final accessToken = await Preferences.getAccessToken();
    print(accessToken);
    if (state.selectedVehicle == null) {
      showErrorSnackbar(context, 'Vui lòng chọn loại xe');
      return;
    }

    if (state.licensePlate == null || state.licensePlate!.isEmpty) {
      showErrorSnackbar(context, 'Vui lòng nhập biển số xe');
      return;
    }

    if (state.cavetNumber == null || state.cavetNumber!.isEmpty) {
      showErrorSnackbar(context, 'Vui lòng nhập số cavet');
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final userId = await Preferences.getUserId();
      final input = RegisterVehicleInput(
        userId: userId,
        vehicleId: state.selectedVehicle!.idString,
        licensePlate: state.licensePlate!,
        cavetNumber: state.cavetNumber!,
      );
      final response = await _vehicleRepository.registerVehicle(input);
      if (response == false) {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
        return;
      }
      showSuccessSnackbar(context, 'Thêm phương tiện thành công');
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
