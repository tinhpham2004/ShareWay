import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/ride/input/rating_driver_input.dart';
import 'package:share_way_frontend/domain/ride/input/rating_hitcher_input.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_rating/bloc/hitch_ride_rating_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class HitchRideRatingBloc extends Cubit<HitchRideRatingState> {
  HitchRideRatingBloc({required this.data}) : super(HitchRideRatingState());

  final _rideRepository = RideRepository();
  final GiveRideRecommendationOuput data;

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {} catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onChangeRating(int value) {
    emit(state.copyWith(star: value == state.star ? null : value));
  }

  void onChangeFeedback(String? value) {
    emit(state.copyWith(feedback: value));
  }

  void onSendFeedback(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final input = RatingDriverInput(
        rating: state.star,
        receiverId: data.user?.id,
        review: state.feedback ?? '',
        rideId: data.rideId,
      );
      final response = await _rideRepository.ratingRideDriver(input);
      if (response) {
        GoRouter.of(context).go(AppPath.home);
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
