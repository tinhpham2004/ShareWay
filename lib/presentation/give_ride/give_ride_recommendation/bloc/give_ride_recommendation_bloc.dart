import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/domain/map/output/create_give_ride/create_give_ride_output.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_recommendation/bloc/give_ride_recommendation_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class GiveRideRecommendationBloc extends Cubit<GiveRideRecommendationState> {
  GiveRideRecommendationBloc() : super(GiveRideRecommendationState());

  final _mapRepository = MapRepository();

  void onStart(
      {required BuildContext context,
      required CreateGiveRideOutput createGiveRideOutput}) {
    emit(state.copyWith(
        isLoading: true, createGiveRideOutput: createGiveRideOutput));
    try {
      onFetchHitchRideRecommendationList(context);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchHitchRideRecommendationList(BuildContext context) async {
    final response = await _mapRepository.getHitchRideRecommendationList(
        state.createGiveRideOutput?.giveRideId ?? '');

    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }

    emit(state.copyWith(hitchRideRecommendationList: response));
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSelectedHitcher({required BuildContext context, required int index}) {
    GoRouter.of(context).push(
      AppPath.giveRideRecommendationDetail,
      extra: state.hitchRideRecommendationList[index].copyWith(
        giveRideId: state.createGiveRideOutput?.giveRideId,
        vehicleId: state.createGiveRideOutput?.vehicleId,
      ),
    );
  }
}
