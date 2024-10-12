enum ButtonTitleEnum {
  confirm,
  resume;

  String get title{
    switch  (this) {
      case ButtonTitleEnum.confirm:
        return 'Xác nhận';
      case ButtonTitleEnum.resume:
        return 'Tiếp tục';
    }
  }
}