import 'package:json_annotation/json_annotation.dart';

part 'chat_model_data.g.dart';

@JsonSerializable()
class ChatModelData {
  String? id;
  String? name;
  @JsonKey(name: 'last_message')
  String? lastMessage;
  DateTime? time;
  @JsonKey(name: 'is_online')
  bool? isOnline;

  ChatModelData(
      {this.id, this.name, this.lastMessage, this.time, this.isOnline});

  factory ChatModelData.fromJson(Map<String, dynamic> json) =>
      _$ChatModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelDataToJson(this);
}
