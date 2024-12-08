import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_bloc.dart';
import 'package:share_way_frontend/presentation/payment_method/bloc/payment_method_state.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';

class PaymentMethodBloc extends Cubit<PaymentMethodState> {
  final HitchRideRecommendationDetailBloc hitchRideRecommendationDetailBloc;

  PaymentMethodBloc({required this.hitchRideRecommendationDetailBloc})
      : super(PaymentMethodState());

  void onStart() {
    try {} catch (e) {
      print(e);
    }
  }

  void onPaymentMethodSelected(
      {required BuildContext context, required int index}) {
    if (index == 1) {
      showErrorSnackbar(context, 'Coming soon!');
      return;
    }

    emit(state.copyWith(selectedPaymentMethod: index));
  }

  void onConfirm(BuildContext context) {
    hitchRideRecommendationDetailBloc
        .onSelectPaymentMethod(state.selectedPaymentMethod);
    GoRouter.of(context).pop();
  }
}
