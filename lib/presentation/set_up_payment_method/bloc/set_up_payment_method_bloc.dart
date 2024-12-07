import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/payment/payment_repository.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';
import 'package:share_way_frontend/presentation/set_up_payment_method/bloc/set_up_payment_method_state.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class SetUpPaymentMethodBloc extends Cubit<SetUpPaymentMethodState> {
  final _paymentRepository = PaymentRepository();

  SetUpPaymentMethodBloc(BuildContext context)
      : super(SetUpPaymentMethodState()) {
    _initDeepLinkListener(context);
  }

  void _initDeepLinkListener(BuildContext context) {
    // Listen for incoming deep links
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        emit(state.copyWith(momoResponse: uri.toString()));
        _handleDeepLink(uri: uri, context: context);
      }
    }, onError: (Object err) {
      print('Error receiving deep link: $err');
    });

    // Handle the app's initial deep link
    getInitialUri().then((Uri? uri) {
      if (uri != null) {
        emit(state.copyWith(momoResponse: uri.toString()));
        _handleDeepLink(uri: uri, context: context);
      }
    });
  }

  void _handleDeepLink({required Uri uri, required BuildContext context}) {
    final path = uri.path;
    final queryParams = uri.queryParameters;

    // GoRouter.of(context).go(path, queryParams: queryParams);
  }

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
