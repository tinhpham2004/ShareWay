// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageOutputCWProxy {
  ChatMessageOutput messageId(String? messageId);

  ChatMessageOutput message(String? message);

  ChatMessageOutput createdAt(DateTime? createdAt);

  ChatMessageOutput messageType(MessageTypeEnum messageType);

  ChatMessageOutput receiverId(String? receiverId);

  ChatMessageOutput senderId(String? senderId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageOutput call({
    String? messageId,
    String? message,
    DateTime? createdAt,
    MessageTypeEnum? messageType,
    String? receiverId,
    String? senderId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessageOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessageOutput.copyWith.fieldName(...)`
class _$ChatMessageOutputCWProxyImpl implements _$ChatMessageOutputCWProxy {
  const _$ChatMessageOutputCWProxyImpl(this._value);

  final ChatMessageOutput _value;

  @override
  ChatMessageOutput messageId(String? messageId) => this(messageId: messageId);

  @override
  ChatMessageOutput message(String? message) => this(message: message);

  @override
  ChatMessageOutput createdAt(DateTime? createdAt) =>
      this(createdAt: createdAt);

  @override
  ChatMessageOutput messageType(MessageTypeEnum messageType) =>
      this(messageType: messageType);

  @override
  ChatMessageOutput receiverId(String? receiverId) =>
      this(receiverId: receiverId);

  @override
  ChatMessageOutput senderId(String? senderId) => this(senderId: senderId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageOutput call({
    Object? messageId = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? messageType = const $CopyWithPlaceholder(),
    Object? receiverId = const $CopyWithPlaceholder(),
    Object? senderId = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageOutput(
      messageId: messageId == const $CopyWithPlaceholder()
          ? _value.messageId
          // ignore: cast_nullable_to_non_nullable
          : messageId as String?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      messageType:
          messageType == const $CopyWithPlaceholder() || messageType == null
              ? _value.messageType
              // ignore: cast_nullable_to_non_nullable
              : messageType as MessageTypeEnum,
      receiverId: receiverId == const $CopyWithPlaceholder()
          ? _value.receiverId
          // ignore: cast_nullable_to_non_nullable
          : receiverId as String?,
      senderId: senderId == const $CopyWithPlaceholder()
          ? _value.senderId
          // ignore: cast_nullable_to_non_nullable
          : senderId as String?,
    );
  }
}

extension $ChatMessageOutputCopyWith on ChatMessageOutput {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessageOutput.copyWith(...)` or like so:`instanceOfChatMessageOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageOutputCWProxy get copyWith =>
      _$ChatMessageOutputCWProxyImpl(this);
}
