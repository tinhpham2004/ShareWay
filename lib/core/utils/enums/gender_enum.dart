enum GenderEnum {
  MALE,
  FEMALE;

  static GenderEnum fromString(String value) {
    switch (value) {
      case 'male':
        return GenderEnum.MALE;
      default:
        return GenderEnum.FEMALE;
    }
  }

  @override
  String toString() {
    switch (this) {
      case GenderEnum.MALE:
        return 'male';
      default:
        return 'female';
    }
  }
}
