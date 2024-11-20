import 'package:dio/dio.dart';
import 'package:share_way_frontend/domain/chat/input/send_image_input.dart';

class SendImageRequest {
  String? roomId;
  String? image;
  String? receiverId;

  SendImageRequest({
    this.roomId,
    this.image,
    this.receiverId,
  });

  FormData toFormData() {
    return FormData.fromMap({
      'chatRoomID': roomId,
      'image': MultipartFile.fromFileSync(
        image!,
        contentType: DioMediaType('image', 'jpeg'),
      ),
      'receiverID': receiverId,
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
