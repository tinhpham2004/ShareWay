import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/map_repository.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation/bloc/hitch_ride_recommendation_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HitchRideRecommendationBloc extends Cubit<HitchRideRecommendationState> {
  HitchRideRecommendationBloc() : super(HitchRideRecommendationState());

  final _mapRepository = MapRepository();

  void onStart({required BuildContext context, required String hitchRideId}) {
    emit(state.copyWith(hitchRideId: hitchRideId));
    try {
      // onFetchGiveRideRecommendationList(context);
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      // emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchGiveRideRecommendationList(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final response = await _mapRepository
        .getGiveRideRecommendationList(state.hitchRideId ?? '');

    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(
        state.copyWith(giveRideRecommendationList: response, isLoading: false));
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSelectedGiver({required BuildContext context, required int index}) {
    GoRouter.of(context).push(AppPath.hitchRideReccomendationDetail,
        extra: state.giveRideRecommendationList[index]
            .copyWith(hitchRideId: state.hitchRideId));
  }
}
