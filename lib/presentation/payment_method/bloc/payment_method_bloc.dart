import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/presentation/payment_method/bloc/payment_method_state.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';

class PaymentMethodBloc extends Cubit<PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodState());

  void onStart() {
    try {
      final paymentMethods = [
        PaymentMethod(title: 'Tiền mặt', icon: AppIcon.money),
        PaymentMethod(title: 'Momo', icon: AppIcon.momo),
      ];

      emit(state.copyWith(paymentMethods: paymentMethods));
    } catch (e) {
      print(e);
    }
  }

  void onPaymentMethodSelected(int index) {
    emit(state.copyWith(selectedPaymentMethod: index));
  }
}
