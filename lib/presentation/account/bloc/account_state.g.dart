// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStateCWProxy {
  AccountState isLoading(bool isLoading);

  AccountState user(AppUser? user);

  AccountState settings(List<Setting> settings);

  AccountState selectedImage(File? selectedImage);

  AccountState assets(List<File> assets);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    bool? isLoading,
    AppUser? user,
    List<Setting>? settings,
    File? selectedImage,
    List<File>? assets,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountState.copyWith.fieldName(...)`
class _$AccountStateCWProxyImpl implements _$AccountStateCWProxy {
  const _$AccountStateCWProxyImpl(this._value);

  final AccountState _value;

  @override
  AccountState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  AccountState user(AppUser? user) => this(user: user);

  @override
  AccountState settings(List<Setting> settings) => this(settings: settings);

  @override
  AccountState selectedImage(File? selectedImage) =>
      this(selectedImage: selectedImage);

  @override
  AccountState assets(List<File> assets) => this(assets: assets);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
    Object? selectedImage = const $CopyWithPlaceholder(),
    Object? assets = const $CopyWithPlaceholder(),
  }) {
    return AccountState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AppUser?,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as List<Setting>,
      selectedImage: selectedImage == const $CopyWithPlaceholder()
          ? _value.selectedImage
          // ignore: cast_nullable_to_non_nullable
          : selectedImage as File?,
      assets: assets == const $CopyWithPlaceholder() || assets == null
          ? _value.assets
          // ignore: cast_nullable_to_non_nullable
          : assets as List<File>,
    );
  }
}

extension $AccountStateCopyWith on AccountState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountState.copyWith(...)` or like so:`instanceOfAccountState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountStateCWProxy get copyWith => _$AccountStateCWProxyImpl(this);
}
