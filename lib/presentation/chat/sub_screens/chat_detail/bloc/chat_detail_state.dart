import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';

part 'chat_detail_state.g.dart';

@CopyWith()
class ChatDetailState {
  final bool isLoading;
  final bool isSendingMessage;
  final bool isSendingCall;
  final List<ChatMessageOutput> messages;
  final TextEditingController? messageController;
  final File? selectedImage;

  ChatDetailState({
    this.isLoading = false,
    this.isSendingMessage = false,
    this.isSendingCall = false,
    this.messages = const [],
    this.messageController,
    this.selectedImage,
  });
}
