class VehiclesInput {
  String? vehicleName;
  int limit;
  int page;

  VehiclesInput({
    this.vehicleName,
    this.limit = 20,
    this.page = 1,
  });
}
