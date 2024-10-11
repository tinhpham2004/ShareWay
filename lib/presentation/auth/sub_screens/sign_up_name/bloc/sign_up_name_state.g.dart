// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_name_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignUpNameStateCWProxy {
  SignUpNameState name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignUpNameState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignUpNameState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpNameState call({
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignUpNameState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSignUpNameState.copyWith.fieldName(...)`
class _$SignUpNameStateCWProxyImpl implements _$SignUpNameStateCWProxy {
  const _$SignUpNameStateCWProxyImpl(this._value);

  final SignUpNameState _value;

  @override
  SignUpNameState name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignUpNameState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignUpNameState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpNameState call({
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return SignUpNameState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $SignUpNameStateCopyWith on SignUpNameState {
  /// Returns a callable class that can be used as follows: `instanceOfSignUpNameState.copyWith(...)` or like so:`instanceOfSignUpNameState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignUpNameStateCWProxy get copyWith => _$SignUpNameStateCWProxyImpl(this);
}
