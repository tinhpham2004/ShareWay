import 'dart:io';

class SendImageInput {
  final String receiverId;
  final String roomId;
  final File image;

  SendImageInput({
    required this.receiverId,
    required this.roomId,
    required this.image,
  });
}
