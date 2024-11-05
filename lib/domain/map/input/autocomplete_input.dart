class AutocompleteInput {
  String input;
  int? limit;
  String? location;
  int? radius;
  bool? moreCompound;
  String? currentLocation;

  AutocompleteInput({
    required this.input,
    this.limit,
    this.location,
    this.moreCompound,
    this.currentLocation,
  });
}
