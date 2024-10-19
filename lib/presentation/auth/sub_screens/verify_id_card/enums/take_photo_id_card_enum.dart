enum TakePhotoIdCardEnum {
  frontSide,
  backSide;

  String get title {
    switch (this) {
      case TakePhotoIdCardEnum.frontSide:
        return 'Mặt trước';
      case TakePhotoIdCardEnum.backSide:
        return 'Mặt sau';
    }
  }
}
