// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OptionItemCWProxy {
  OptionItem idString(String? idString);

  OptionItem idInt(int? idInt);

  OptionItem name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OptionItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OptionItem(...).copyWith(id: 12, name: "My name")
  /// ````
  OptionItem call({
    String? idString,
    int? idInt,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOptionItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOptionItem.copyWith.fieldName(...)`
class _$OptionItemCWProxyImpl implements _$OptionItemCWProxy {
  const _$OptionItemCWProxyImpl(this._value);

  final OptionItem _value;

  @override
  OptionItem idString(String? idString) => this(idString: idString);

  @override
  OptionItem idInt(int? idInt) => this(idInt: idInt);

  @override
  OptionItem name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OptionItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OptionItem(...).copyWith(id: 12, name: "My name")
  /// ````
  OptionItem call({
    Object? idString = const $CopyWithPlaceholder(),
    Object? idInt = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return OptionItem(
      idString: idString == const $CopyWithPlaceholder()
          ? _value.idString
          // ignore: cast_nullable_to_non_nullable
          : idString as String?,
      idInt: idInt == const $CopyWithPlaceholder()
          ? _value.idInt
          // ignore: cast_nullable_to_non_nullable
          : idInt as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $OptionItemCopyWith on OptionItem {
  /// Returns a callable class that can be used as follows: `instanceOfOptionItem.copyWith(...)` or like so:`instanceOfOptionItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OptionItemCWProxy get copyWith => _$OptionItemCWProxyImpl(this);
}
