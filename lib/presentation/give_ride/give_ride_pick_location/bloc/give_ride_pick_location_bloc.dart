import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/input/autocomplete_input.dart';
import 'package:share_way_frontend/domain/map/input/create_give_ride_input.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/domain/map/output/autocomplete/autocomplete_output.dart';
import 'package:share_way_frontend/domain/map/output/geocode/geocode_output.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_location/bloc/give_ride_pick_location_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class GiveRidePickLocationBloc extends Cubit<GiveRidePickLocationState> {
  GiveRidePickLocationBloc() : super(GiveRidePickLocationState());

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
      ),
    );

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () async {
      if (location.length >= 2) {
        emit(state.copyWith(isLoading: true));
        final currentLocation = await _onGetCurrentLocation();
        if (currentLocation?.latitude != null &&
            currentLocation?.longitude != null) {
          final input = AutocompleteInput(
              input: location,
              currentLocation:
                  '${currentLocation?.latitude},${currentLocation?.longitude}');
          final response = await _mapRepository.getAutocomplete(input);
          if (response != null) {
            emit(
              state.copyWith(
                autocompleteList: response,
              ),
            );
          }
        }
        emit(state.copyWith(isLoading: false));
      }
    });
  }

  Future<Geocode?> _onGetCurrentLocation() async {
    final currentLocation = await Preferences.getCurrentLocation();
    return currentLocation;
  }

  void onChangeEdittingIndex(int index) {
    emit(
      state.copyWith(
        edittingIndex: index,
      ),
    );
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

  void onConfirm(BuildContext context) {
    if (state.locationList.any((item) => item.idString == null)) {
      showErrorSnackbar(context, 'Địa điểm chưa hợp lệ');
      return;
    }

    final data = CreateGiveRideInput(
      locationList: state.locationList,
    );

    GoRouter.of(context).push(AppPath.giveRidePickTime, extra: data);
  }

  Future<List<GeocodeOutput>?> onChangeLocationOnMap({
    required BuildContext context,
    required double lng,
    required double lat,
  }) async {
    emit(state.copyWith(isLoading: true));
    final currentLocation = await _onGetCurrentLocation();
    if (currentLocation == null) {
      showErrorSnackbar(context, 'Không thể xác định vị trí');
      emit(state.copyWith(isLoading: false));
      return null;
    }
    final input = [
      Geocode(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude),
      Geocode(latitude: lat, longitude: lng)
    ];
    final response = await _mapRepository.getLocationFromGeocode(input);
    if (response == null) {
      showErrorSnackbar(context, 'Không thể xác định vị trí');
      emit(state.copyWith(isLoading: false));
      return null;
    }
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
    return response;
  }

  void onSelectLocationOnMap({
    required BuildContext context,
    required OptionItem item,
  }) {
    final locationList = List<OptionItem>.from(state.locationList);
    if (state.edittingIndex == null) {
      showErrorSnackbar(context, 'Vui lòng chọn vị trí cần chỉnh sửa');
      return;
    }
    locationList[state.edittingIndex!] =
        locationList[state.edittingIndex!].copyWith(
      idString: item.idString,
      name: item.name ?? '',
    );
    emit(
      state.copyWith(
        locationList: locationList,
        dataChange: !state.dataChange,
      ),
    );
  }
}
