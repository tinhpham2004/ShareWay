import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/core/utils/enums/gender_enum.dart';
import 'package:share_way_frontend/data/api/chat/response/get_chat_rooms_response/chat_room_response.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

part 'chat_rooms_output.g.dart';

@CopyWith()
class ChatRoomsOutput {
  final String? roomId;
  final AppUser? receiver;
  final String? lastMessage;
  final DateTime? lastMessageAt;

  ChatRoomsOutput({
    this.roomId,
    this.receiver,
    this.lastMessage,
    this.lastMessageAt,
  });

  factory ChatRoomsOutput.fromApiModel(ChatRoomResponse response) {
    return ChatRoomsOutput(
      roomId: response.roomId,
      receiver: AppUser(
        id: response.receiverInfo?.userId,
        fullName: response.receiverInfo?.fullName,
        phoneNumber: response.receiverInfo?.phoneNumber,
        avatarUrl: response.receiverInfo?.avatarUrl,
        averageRating: response.receiverInfo?.averageRating,
        gender: GenderEnum.fromString(response.receiverInfo?.gender ?? ''),
      ),
      lastMessage: response.lastMessage,
      lastMessageAt: response.lastMessageAt,
    );
  }
}
