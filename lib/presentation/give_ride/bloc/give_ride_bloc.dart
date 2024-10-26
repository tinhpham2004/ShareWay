import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/input/autocomplete_input.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete_output.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/presentation/give_ride/bloc/give_ride_state.dart';

class GiveRideBloc extends Cubit<GiveRideState> {
  GiveRideBloc() : super(GiveRideState());

  Timer? _debounce;

  final _mapRepository = MapRepository();

  void onStart(BuildContext context) {
    emit(state.copyWith(isLoading: true));
    try {
      onAddLocation(context);
      onAddLocation(context);
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onAddLocation(BuildContext context) {
    if (state.locationList.length >= 5) {
      showErrorSnackbar(context, 'Bạn chỉ có thể chọn tối đa 5 điểm');
      return;
    }
    emit(
      state.copyWith(
        locationList: [...state.locationList, OptionItem()],
        dataChange: !state.dataChange,
      ),
    );
  }

  void onRemoveLocation(int index) {
    emit(
      state.copyWith(
        locationList: List.from(state.locationList)..removeAt(index),
        dataChange: !state.dataChange,
      ),
    );
  }

  void onSwapLocation(int index) {
    final locationList = List<OptionItem>.from(state.locationList);
    final temp = locationList[index];
    locationList[index] = locationList[index - 1];
    locationList[index - 1] = temp;
    emit(
      state.copyWith(
        locationList: locationList,
        dataChange: !state.dataChange,
      ),
    );
  }

  void onChangeLocation({
    required BuildContext context,
    required int index,
    required String location,
  }) {
    final locationList = List<OptionItem>.from(state.locationList);
    locationList[index] =
        locationList[index].copyWith(idString: null, name: location);
    emit(
      state.copyWith(
        locationList: locationList,
        edittingIndex: index,
      ),
    );

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 3), () async {
      if (location.length >= 2) {
        final input = AutocompleteInput(input: location);
        final response = await _mapRepository.getAutocomplete(input);
        if (response != null) {
          emit(
            state.copyWith(
              autocompleteList: response,
            ),
          );
        }
      }
    });
  }

  void onChangeSelectedButtonIndex(int index) {
    emit(
      state.copyWith(
        selectedButtonIndex: index,
      ),
    );
  }

  void onSelectAutocomplete(
      {required BuildContext context, required AutocompleteOutput item}) {
    final locationList = List<OptionItem>.from(state.locationList);
    if (state.edittingIndex == null) {
      showErrorSnackbar(context, 'Vui lòng chọn vị trí cần chỉnh sửa');
      return;
    }
    locationList[state.edittingIndex!] =
        locationList[state.edittingIndex!].copyWith(
      idString: item.placeId,
      name: item.description ?? '',
    );
    emit(
      state.copyWith(
        locationList: locationList,
        autocompleteList: [],
        dataChange: !state.dataChange,
      ),
    );
  }

  void onConfirmButtonPressed(BuildContext context) {
    if (state.locationList.any((item) => item.idString == null)) {
      showErrorSnackbar(context, 'Địa điểm chưa hợp lệ');
      return;
    }

    showSuccessSnackbar(context, 'Số địa điểm đã chọn: ${state.locationList.length}');
  }
}
