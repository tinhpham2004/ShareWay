import 'package:dio/dio.dart';
import 'package:share_way_frontend/domain/chat/input/send_image_input.dart';

class SendImageRequest {
  String? receiverId;
  String? roomId;
  String? image;

  SendImageRequest({
    this.receiverId,
    this.roomId,
    this.image,
  });

  FormData toFormData() {
    return FormData.fromMap({
      'image': MultipartFile.fromFileSync(image!),
      'chatRoomID ': roomId,
      'receiverID ': receiverId,
    });
  }

  factory SendImageRequest.toApiModel(SendImageInput data) {
    return SendImageRequest(
      receiverId: data.receiverId,
      roomId: data.roomId,
      image: data.image.path,
    );
  }
}
