// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomsStateCWProxy {
  ChatRoomsState isLoading(bool isLoading);

  ChatRoomsState chatRooms(List<ChatRoomsOutput> chatRooms);

  ChatRoomsState selectedChat(ChatRoomsOutput? selectedChat);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomsState call({
    bool? isLoading,
    List<ChatRoomsOutput>? chatRooms,
    ChatRoomsOutput? selectedChat,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomsState.copyWith.fieldName(...)`
class _$ChatRoomsStateCWProxyImpl implements _$ChatRoomsStateCWProxy {
  const _$ChatRoomsStateCWProxyImpl(this._value);

  final ChatRoomsState _value;

  @override
  ChatRoomsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ChatRoomsState chatRooms(List<ChatRoomsOutput> chatRooms) =>
      this(chatRooms: chatRooms);

  @override
  ChatRoomsState selectedChat(ChatRoomsOutput? selectedChat) =>
      this(selectedChat: selectedChat);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomsState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? chatRooms = const $CopyWithPlaceholder(),
    Object? selectedChat = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomsState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      chatRooms: chatRooms == const $CopyWithPlaceholder() || chatRooms == null
          ? _value.chatRooms
          // ignore: cast_nullable_to_non_nullable
          : chatRooms as List<ChatRoomsOutput>,
      selectedChat: selectedChat == const $CopyWithPlaceholder()
          ? _value.selectedChat
          // ignore: cast_nullable_to_non_nullable
          : selectedChat as ChatRoomsOutput?,
    );
  }
}

extension $ChatRoomsStateCopyWith on ChatRoomsState {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomsState.copyWith(...)` or like so:`instanceOfChatRoomsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomsStateCWProxy get copyWith => _$ChatRoomsStateCWProxyImpl(this);
}
