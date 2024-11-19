// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomsOutputCWProxy {
  ChatRoomsOutput roomId(String? roomId);

  ChatRoomsOutput receiver(AppUser? receiver);

  ChatRoomsOutput lastMessage(String? lastMessage);

  ChatRoomsOutput lastMessageAt(DateTime? lastMessageAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomsOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomsOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomsOutput call({
    String? roomId,
    AppUser? receiver,
    String? lastMessage,
    DateTime? lastMessageAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomsOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomsOutput.copyWith.fieldName(...)`
class _$ChatRoomsOutputCWProxyImpl implements _$ChatRoomsOutputCWProxy {
  const _$ChatRoomsOutputCWProxyImpl(this._value);

  final ChatRoomsOutput _value;

  @override
  ChatRoomsOutput roomId(String? roomId) => this(roomId: roomId);

  @override
  ChatRoomsOutput receiver(AppUser? receiver) => this(receiver: receiver);

  @override
  ChatRoomsOutput lastMessage(String? lastMessage) =>
      this(lastMessage: lastMessage);

  @override
  ChatRoomsOutput lastMessageAt(DateTime? lastMessageAt) =>
      this(lastMessageAt: lastMessageAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomsOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomsOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomsOutput call({
    Object? roomId = const $CopyWithPlaceholder(),
    Object? receiver = const $CopyWithPlaceholder(),
    Object? lastMessage = const $CopyWithPlaceholder(),
    Object? lastMessageAt = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomsOutput(
      roomId: roomId == const $CopyWithPlaceholder()
          ? _value.roomId
          // ignore: cast_nullable_to_non_nullable
          : roomId as String?,
      receiver: receiver == const $CopyWithPlaceholder()
          ? _value.receiver
          // ignore: cast_nullable_to_non_nullable
          : receiver as AppUser?,
      lastMessage: lastMessage == const $CopyWithPlaceholder()
          ? _value.lastMessage
          // ignore: cast_nullable_to_non_nullable
          : lastMessage as String?,
      lastMessageAt: lastMessageAt == const $CopyWithPlaceholder()
          ? _value.lastMessageAt
          // ignore: cast_nullable_to_non_nullable
          : lastMessageAt as DateTime?,
    );
  }
}

extension $ChatRoomsOutputCopyWith on ChatRoomsOutput {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomsOutput.copyWith(...)` or like so:`instanceOfChatRoomsOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomsOutputCWProxy get copyWith => _$ChatRoomsOutputCWProxyImpl(this);
}
