// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_information_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditInformationStateCWProxy {
  EditInformationState isLoading(bool isLoading);

  EditInformationState dataChange(bool dataChange);

  EditInformationState user(AppUser? user);

  EditInformationState gender(List<OptionItem> gender);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditInformationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditInformationState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditInformationState call({
    bool? isLoading,
    bool? dataChange,
    AppUser? user,
    List<OptionItem>? gender,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditInformationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditInformationState.copyWith.fieldName(...)`
class _$EditInformationStateCWProxyImpl
    implements _$EditInformationStateCWProxy {
  const _$EditInformationStateCWProxyImpl(this._value);

  final EditInformationState _value;

  @override
  EditInformationState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  EditInformationState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  EditInformationState user(AppUser? user) => this(user: user);

  @override
  EditInformationState gender(List<OptionItem> gender) => this(gender: gender);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditInformationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditInformationState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditInformationState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
  }) {
    return EditInformationState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AppUser?,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as List<OptionItem>,
    );
  }
}

extension $EditInformationStateCopyWith on EditInformationState {
  /// Returns a callable class that can be used as follows: `instanceOfEditInformationState.copyWith(...)` or like so:`instanceOfEditInformationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EditInformationStateCWProxy get copyWith =>
      _$EditInformationStateCWProxyImpl(this);
}
