import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/data/api/chat/response/get_chat_messages_response/message_response.dart';
part 'chat_message_output.g.dart';

@CopyWith()
class ChatMessageOutput {
  final String? messageId;
  final String? message;
  final DateTime? createdAt;
  final MessageTypeEnum messageType;
  final String? receiverId;
  final String? senderId;

  ChatMessageOutput({
    this.messageId,
    this.message,
    this.createdAt,
    this.messageType = MessageTypeEnum.TEXT,
    this.receiverId,
    this.senderId,
  });

  factory ChatMessageOutput.fromApiModel(MessageResponse response) {
    return ChatMessageOutput(
      messageId: response.messageId,
      message: response.message,
      createdAt: response.createdAt,
      messageType: MessageTypeEnum.fromString(response.messageType ?? ''),
      receiverId: response.receiverId,
      senderId: response.senderId,
    );
  }
}
