import 'package:copy_with_extension/copy_with_extension.dart';

part 'payment_method_state.g.dart';

@CopyWith()
class PaymentMethodState {
  final bool isLoading;
  final bool dataChange;


  PaymentMethodState({
    this.isLoading = false,
    this.dataChange = false,
  });
}
