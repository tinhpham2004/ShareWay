import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'geocode.g.dart';

@JsonSerializable()
@CopyWith()
class Geocode {
  final double latitude;
  final double longitude;
  Geocode({
    required this.latitude,
    required this.longitude,
  });

  factory Geocode.fromJson(Map<String, dynamic> json) =>
      _$GeocodeFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodeToJson(this);
}
