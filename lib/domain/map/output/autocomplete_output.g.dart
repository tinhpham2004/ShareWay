// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AutocompleteOutputCWProxy {
  AutocompleteOutput placeId(String? placeId);

  AutocompleteOutput description(String? description);

  AutocompleteOutput mainText(String? mainText);

  AutocompleteOutput secondaryText(String? secondaryText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AutocompleteOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AutocompleteOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  AutocompleteOutput call({
    String? placeId,
    String? description,
    String? mainText,
    String? secondaryText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAutocompleteOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAutocompleteOutput.copyWith.fieldName(...)`
class _$AutocompleteOutputCWProxyImpl implements _$AutocompleteOutputCWProxy {
  const _$AutocompleteOutputCWProxyImpl(this._value);

  final AutocompleteOutput _value;

  @override
  AutocompleteOutput placeId(String? placeId) => this(placeId: placeId);

  @override
  AutocompleteOutput description(String? description) =>
      this(description: description);

  @override
  AutocompleteOutput mainText(String? mainText) => this(mainText: mainText);

  @override
  AutocompleteOutput secondaryText(String? secondaryText) =>
      this(secondaryText: secondaryText);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AutocompleteOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AutocompleteOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  AutocompleteOutput call({
    Object? placeId = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? mainText = const $CopyWithPlaceholder(),
    Object? secondaryText = const $CopyWithPlaceholder(),
  }) {
    return AutocompleteOutput(
      placeId: placeId == const $CopyWithPlaceholder()
          ? _value.placeId
          // ignore: cast_nullable_to_non_nullable
          : placeId as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      mainText: mainText == const $CopyWithPlaceholder()
          ? _value.mainText
          // ignore: cast_nullable_to_non_nullable
          : mainText as String?,
      secondaryText: secondaryText == const $CopyWithPlaceholder()
          ? _value.secondaryText
          // ignore: cast_nullable_to_non_nullable
          : secondaryText as String?,
    );
  }
}

extension $AutocompleteOutputCopyWith on AutocompleteOutput {
  /// Returns a callable class that can be used as follows: `instanceOfAutocompleteOutput.copyWith(...)` or like so:`instanceOfAutocompleteOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AutocompleteOutputCWProxy get copyWith =>
      _$AutocompleteOutputCWProxyImpl(this);
}
