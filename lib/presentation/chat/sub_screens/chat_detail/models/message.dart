import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

class Message {
  final String? id;
  final AppUser? sender;
  final String? message;
  final DateTime? time;
  final int? duration;
  final MessageTypeEnum type;

  Message({
    this.id,
    this.sender,
    this.message,
    this.time,
    this.duration,
    this.type = MessageTypeEnum.TEXT,
  });
}
