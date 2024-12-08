// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentMethodStateCWProxy {
  PaymentMethodState isLoading(bool isLoading);

  PaymentMethodState dataChange(bool dataChange);

  PaymentMethodState selectedPaymentMethod(int selectedPaymentMethod);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentMethodState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentMethodState(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentMethodState call({
    bool? isLoading,
    bool? dataChange,
    int? selectedPaymentMethod,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentMethodState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentMethodState.copyWith.fieldName(...)`
class _$PaymentMethodStateCWProxyImpl implements _$PaymentMethodStateCWProxy {
  const _$PaymentMethodStateCWProxyImpl(this._value);

  final PaymentMethodState _value;

  @override
  PaymentMethodState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PaymentMethodState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  PaymentMethodState selectedPaymentMethod(int selectedPaymentMethod) =>
      this(selectedPaymentMethod: selectedPaymentMethod);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentMethodState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentMethodState(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentMethodState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedPaymentMethod = const $CopyWithPlaceholder(),
  }) {
    return PaymentMethodState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      selectedPaymentMethod:
          selectedPaymentMethod == const $CopyWithPlaceholder() ||
                  selectedPaymentMethod == null
              ? _value.selectedPaymentMethod
              // ignore: cast_nullable_to_non_nullable
              : selectedPaymentMethod as int,
    );
  }
}

extension $PaymentMethodStateCopyWith on PaymentMethodState {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentMethodState.copyWith(...)` or like so:`instanceOfPaymentMethodState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentMethodStateCWProxy get copyWith =>
      _$PaymentMethodStateCWProxyImpl(this);
}
