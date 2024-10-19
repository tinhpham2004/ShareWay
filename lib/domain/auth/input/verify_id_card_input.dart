import 'dart:io';

class VerifyIdCardInput {
  final File frontSideImage;
  final File backSideImage;
  final String phoneNumber;
  final String userId;

  VerifyIdCardInput({
    required this.frontSideImage,
    required this.backSideImage,
    required this.phoneNumber,
    required this.userId,
  });
}
