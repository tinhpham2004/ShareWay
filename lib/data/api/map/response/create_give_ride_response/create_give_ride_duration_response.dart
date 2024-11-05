import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_duration_response.g.dart';

@JsonSerializable()
class CreateGiveRideDurationResponse {
  String? text;
  int? value;

  CreateGiveRideDurationResponse({this.text, this.value});

  factory CreateGiveRideDurationResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateGiveRideDurationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateGiveRideDurationResponseToJson(this);
}
