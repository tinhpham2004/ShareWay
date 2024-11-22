import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';

class UpdateCallInput {
  final String? callId;
  final MessageTypeEnum type;
  final String? roomId;
  final int? duration;
  final String? receiverId;

  UpdateCallInput({
    this.callId,
    this.type = MessageTypeEnum.CALL,
    this.roomId,
    this.duration,
    this.receiverId,
  });
}
