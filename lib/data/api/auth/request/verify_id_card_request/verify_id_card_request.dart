import 'package:dio/dio.dart';
import 'package:share_way_frontend/domain/auth/input/verify_id_card_input.dart';

class VerifyIdCardRequest {
  String? frontSideImage;
  String? backSideImage;
  String? phoneNumber;
  String? userId;

  VerifyIdCardRequest({
    this.frontSideImage,
    this.backSideImage,
    this.phoneNumber,
    this.userId,
  });

  FormData toFormData() {
    return FormData.fromMap({
      'front_image': MultipartFile.fromFileSync(
        frontSideImage!,
        contentType: DioMediaType('image', 'jpeg'),
      ),
      'back_image': MultipartFile.fromFileSync(
        backSideImage!,
        contentType: DioMediaType('image', 'jpeg'),
      ),
      'phone_number': phoneNumber,
      'user_id': userId,
    });
  }

  factory VerifyIdCardRequest.toApiModel(VerifyIdCardInput data) {
    return VerifyIdCardRequest(
      frontSideImage: data.frontSideImage.path,
      backSideImage: data.backSideImage.path,
      phoneNumber: data.phoneNumber,
      userId: data.userId,
    );
  }
}
