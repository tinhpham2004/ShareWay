import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';

part 'set_up_payment_method_state.g.dart';

@CopyWith()
class SetUpPaymentMethodState {
  final bool isLoading;
  final bool dataChange;
  final List<PaymentMethod> paymentMethods;
  final int selectedPaymentMethod;
  final String? momoAccount;
  final String? momoResponse;

  SetUpPaymentMethodState({
    this.isLoading = false,
    this.dataChange = false,
    this.paymentMethods = const [],
    this.selectedPaymentMethod = 0,
    this.momoAccount,
    this.momoResponse,
  });
}
