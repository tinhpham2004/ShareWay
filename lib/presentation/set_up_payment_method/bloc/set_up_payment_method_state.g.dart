// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_up_payment_method_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetUpPaymentMethodStateCWProxy {
  SetUpPaymentMethodState isLoading(bool isLoading);

  SetUpPaymentMethodState dataChange(bool dataChange);

  SetUpPaymentMethodState paymentMethods(List<PaymentMethod> paymentMethods);

  SetUpPaymentMethodState selectedPaymentMethod(int selectedPaymentMethod);

  SetUpPaymentMethodState momoAccount(String? momoAccount);

  SetUpPaymentMethodState momoResponse(String? momoResponse);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetUpPaymentMethodState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetUpPaymentMethodState(...).copyWith(id: 12, name: "My name")
  /// ````
  SetUpPaymentMethodState call({
    bool? isLoading,
    bool? dataChange,
    List<PaymentMethod>? paymentMethods,
    int? selectedPaymentMethod,
    String? momoAccount,
    String? momoResponse,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetUpPaymentMethodState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetUpPaymentMethodState.copyWith.fieldName(...)`
class _$SetUpPaymentMethodStateCWProxyImpl
    implements _$SetUpPaymentMethodStateCWProxy {
  const _$SetUpPaymentMethodStateCWProxyImpl(this._value);

  final SetUpPaymentMethodState _value;

  @override
  SetUpPaymentMethodState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  SetUpPaymentMethodState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  SetUpPaymentMethodState paymentMethods(List<PaymentMethod> paymentMethods) =>
      this(paymentMethods: paymentMethods);

  @override
  SetUpPaymentMethodState selectedPaymentMethod(int selectedPaymentMethod) =>
      this(selectedPaymentMethod: selectedPaymentMethod);

  @override
  SetUpPaymentMethodState momoAccount(String? momoAccount) =>
      this(momoAccount: momoAccount);

  @override
  SetUpPaymentMethodState momoResponse(String? momoResponse) =>
      this(momoResponse: momoResponse);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetUpPaymentMethodState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetUpPaymentMethodState(...).copyWith(id: 12, name: "My name")
  /// ````
  SetUpPaymentMethodState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? paymentMethods = const $CopyWithPlaceholder(),
    Object? selectedPaymentMethod = const $CopyWithPlaceholder(),
    Object? momoAccount = const $CopyWithPlaceholder(),
    Object? momoResponse = const $CopyWithPlaceholder(),
  }) {
    return SetUpPaymentMethodState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      paymentMethods: paymentMethods == const $CopyWithPlaceholder() ||
              paymentMethods == null
          ? _value.paymentMethods
          // ignore: cast_nullable_to_non_nullable
          : paymentMethods as List<PaymentMethod>,
      selectedPaymentMethod:
          selectedPaymentMethod == const $CopyWithPlaceholder() ||
                  selectedPaymentMethod == null
              ? _value.selectedPaymentMethod
              // ignore: cast_nullable_to_non_nullable
              : selectedPaymentMethod as int,
      momoAccount: momoAccount == const $CopyWithPlaceholder()
          ? _value.momoAccount
          // ignore: cast_nullable_to_non_nullable
          : momoAccount as String?,
      momoResponse: momoResponse == const $CopyWithPlaceholder()
          ? _value.momoResponse
          // ignore: cast_nullable_to_non_nullable
          : momoResponse as String?,
    );
  }
}

extension $SetUpPaymentMethodStateCopyWith on SetUpPaymentMethodState {
  /// Returns a callable class that can be used as follows: `instanceOfSetUpPaymentMethodState.copyWith(...)` or like so:`instanceOfSetUpPaymentMethodState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetUpPaymentMethodStateCWProxy get copyWith =>
      _$SetUpPaymentMethodStateCWProxyImpl(this);
}
