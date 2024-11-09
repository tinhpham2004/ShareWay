// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatListStateCWProxy {
  ChatListState isLoading(bool isLoading);

  ChatListState chatList(List<ChatModelData> chatList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatListState call({
    bool? isLoading,
    List<ChatModelData>? chatList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatListState.copyWith.fieldName(...)`
class _$ChatListStateCWProxyImpl implements _$ChatListStateCWProxy {
  const _$ChatListStateCWProxyImpl(this._value);

  final ChatListState _value;

  @override
  ChatListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ChatListState chatList(List<ChatModelData> chatList) =>
      this(chatList: chatList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatListState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? chatList = const $CopyWithPlaceholder(),
  }) {
    return ChatListState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      chatList: chatList == const $CopyWithPlaceholder() || chatList == null
          ? _value.chatList
          // ignore: cast_nullable_to_non_nullable
          : chatList as List<ChatModelData>,
    );
  }
}

extension $ChatListStateCopyWith on ChatListState {
  /// Returns a callable class that can be used as follows: `instanceOfChatListState.copyWith(...)` or like so:`instanceOfChatListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatListStateCWProxy get copyWith => _$ChatListStateCWProxyImpl(this);
}
