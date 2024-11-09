import 'package:json_annotation/json_annotation.dart';

import 'chat_model_data.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  List<ChatModelData>? data;

  ChatModel({this.data});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return _$ChatModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
