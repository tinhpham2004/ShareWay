// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatDetailStateCWProxy {
  ChatDetailState isLoading(bool isLoading);

  ChatDetailState isSendingMessage(bool isSendingMessage);

  ChatDetailState isSendingCall(bool isSendingCall);

  ChatDetailState messages(List<ChatMessageOutput> messages);

  ChatDetailState messageController(TextEditingController? messageController);

  ChatDetailState selectedImage(File? selectedImage);

  ChatDetailState initCallOutput(InitCallOutput? initCallOutput);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatDetailState call({
    bool? isLoading,
    bool? isSendingMessage,
    bool? isSendingCall,
    List<ChatMessageOutput>? messages,
    TextEditingController? messageController,
    File? selectedImage,
    InitCallOutput? initCallOutput,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatDetailState.copyWith.fieldName(...)`
class _$ChatDetailStateCWProxyImpl implements _$ChatDetailStateCWProxy {
  const _$ChatDetailStateCWProxyImpl(this._value);

  final ChatDetailState _value;

  @override
  ChatDetailState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ChatDetailState isSendingMessage(bool isSendingMessage) =>
      this(isSendingMessage: isSendingMessage);

  @override
  ChatDetailState isSendingCall(bool isSendingCall) =>
      this(isSendingCall: isSendingCall);

  @override
  ChatDetailState messages(List<ChatMessageOutput> messages) =>
      this(messages: messages);

  @override
  ChatDetailState messageController(TextEditingController? messageController) =>
      this(messageController: messageController);

  @override
  ChatDetailState selectedImage(File? selectedImage) =>
      this(selectedImage: selectedImage);

  @override
  ChatDetailState initCallOutput(InitCallOutput? initCallOutput) =>
      this(initCallOutput: initCallOutput);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatDetailState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isSendingMessage = const $CopyWithPlaceholder(),
    Object? isSendingCall = const $CopyWithPlaceholder(),
    Object? messages = const $CopyWithPlaceholder(),
    Object? messageController = const $CopyWithPlaceholder(),
    Object? selectedImage = const $CopyWithPlaceholder(),
    Object? initCallOutput = const $CopyWithPlaceholder(),
  }) {
    return ChatDetailState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isSendingMessage: isSendingMessage == const $CopyWithPlaceholder() ||
              isSendingMessage == null
          ? _value.isSendingMessage
          // ignore: cast_nullable_to_non_nullable
          : isSendingMessage as bool,
      isSendingCall:
          isSendingCall == const $CopyWithPlaceholder() || isSendingCall == null
              ? _value.isSendingCall
              // ignore: cast_nullable_to_non_nullable
              : isSendingCall as bool,
      messages: messages == const $CopyWithPlaceholder() || messages == null
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<ChatMessageOutput>,
      messageController: messageController == const $CopyWithPlaceholder()
          ? _value.messageController
          // ignore: cast_nullable_to_non_nullable
          : messageController as TextEditingController?,
      selectedImage: selectedImage == const $CopyWithPlaceholder()
          ? _value.selectedImage
          // ignore: cast_nullable_to_non_nullable
          : selectedImage as File?,
      initCallOutput: initCallOutput == const $CopyWithPlaceholder()
          ? _value.initCallOutput
          // ignore: cast_nullable_to_non_nullable
          : initCallOutput as InitCallOutput?,
    );
  }
}

extension $ChatDetailStateCopyWith on ChatDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfChatDetailState.copyWith(...)` or like so:`instanceOfChatDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatDetailStateCWProxy get copyWith => _$ChatDetailStateCWProxyImpl(this);
}
