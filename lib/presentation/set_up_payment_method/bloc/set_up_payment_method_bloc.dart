import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/payment/payment_repository.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';
import 'package:share_way_frontend/presentation/set_up_payment_method/bloc/set_up_payment_method_state.dart';

class SetUpPaymentMethodBloc extends Cubit<SetUpPaymentMethodState> {
  final _paymentRepository = PaymentRepository();

  SetUpPaymentMethodBloc(BuildContext context)
      : super(SetUpPaymentMethodState());

  void onStart() {
    try {
      final paymentMethods = [
        PaymentMethod(title: 'Tiền mặt', icon: AppIcon.money),
        PaymentMethod(title: 'Momo', icon: AppIcon.momo),
      ];

      emit(state.copyWith(
        paymentMethods: paymentMethods,
      ));
    } catch (e) {
      print(e);
    }
  }

  void onChangeMomoAccount(String? value) {
    emit(state.copyWith(momoAccount: value));
  }

  void onPaymentMethodSelected(int index) {
    emit(state.copyWith(selectedPaymentMethod: index));
  }

  void onConfirm(BuildContext context) async {
    if (state.selectedPaymentMethod == 1) {
      final response =
          await _paymentRepository.linkMomoWallet(state.momoAccount!);
      if (response != null) {
        final deeplink = Uri.tryParse(response);
        if (deeplink == null) {
          showErrorSnackbar(context, 'Liên kết tài khoản Momo thất bại');
          return;
        }

        showErrorSnackbar(context, 'Coming soon!');
        // // final canLaunch = await canLaunchUrl(deeplink);
        // // if (canLaunch) {
        // await launchUrl(deeplink);
        // // } else {
        // //   print("Could not launch $deeplink");
        // // }
      } else {
        showErrorSnackbar(context, 'Liên kết tài khoản Momo thất bại');
      }
    }
  }
}
