import 'dart:convert';

import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/chat/request/send_image_request/send_image_request.dart';
import 'package:share_way_frontend/data/api/chat/request/send_message_request/send_message_request.dart';
import 'package:share_way_frontend/data/api/chat/response/get_chat_messages_response/get_chat_messages_response.dart';
import 'package:share_way_frontend/data/api/chat/response/get_chat_messages_response/message_response.dart';
import 'package:share_way_frontend/data/api/chat/response/get_chat_rooms_response/get_chat_rooms_response.dart';

class ChatService {
  final _service = ApiService();

  Future<GetChatRoomsResponse?> getChatRooms(String userId) async {
    final response = await _service.post(
      ChatApi.getChatRooms,
      data: {"userID": userId},
      fromJson: (json) => GetChatRoomsResponse.fromJson(json),
    );
    // final response =
    //     GetChatRoomsResponse.fromJson(jsonDecode(getChatRoomsJson));
    return response;
  }

  Future<GetChatMessagesResponse?> getChatMessages(String roomId) async {
    final response = await _service.post(
      ChatApi.getChatMessages,
      data: {"chatRoomID": roomId},
      fromJson: (json) => GetChatMessagesResponse.fromJson(json),
    );
    // final response =
    //     GetChatMessagesResponse.fromJson(jsonDecode(getChatMessagesJson));
    return response;
  }

  Future<MessageResponse?> sendMessage(SendMessageRequest request) async {
    final response = await _service.post(
      ChatApi.sendMessage,
      data: request.toJson(),
      fromJson: (json) => MessageResponse.fromJson(json['data']),
    );
    return response;
  }

  Future<MessageResponse?> sendImage(SendImageRequest request) async {
    final response = await _service.post(
      ChatApi.sendImage,
      data: request.toFormData(),
      fromJson: (json) => MessageResponse.fromJson(json['data']),
    );
    return response;
  }
}

const String getChatRoomsJson = '''
{
  "data": {
    "chatRooms": [
      {
        "last_message": "Hello, how are you?",
        "last_message_at": "2024-11-19T14:30:00Z",
        "last_message_id": "msg123",
        "receiver_info": {
          "full_name": "John Doe",
          "phone_number": "+1234567890",
          "user_id": "user001"
        },
        "room_id": "room001"
      },
      {
        "last_message": "Let's schedule a meeting.",
        "last_message_at": "2024-11-19T14:30:00Z",
        "last_message_id": "msg124",
        "receiver_info": {
          "full_name": "Jane Smith",
          "phone_number": "+9876543210",
          "user_id": "user002"
        },
        "room_id": "room002"
      }
    ]
  },
  "error": null,
  "message_en": "Request successful",
  "message_vi": "Yêu cầu thành công",
  "success": true
}
''';

const String getChatMessagesJson = '''
{
  "data": {
    "messages": [
      {
        "created_at": "2024-11-19T15:45:00Z",
        "message": "Hello, how are you?",
        "message_id": "msg123",
        "message_type": "text",
        "receiver_id": "user001",
        "sender_id": "user002"
      },
      {
        "created_at": "2024-11-19T15:46:30Z",
        "message": "3 phút 45 giây",
        "message_id": "msg124",
        "message_type": "voice_call",
        "receiver_id": "user002",
        "sender_id": "user001"
      },
      {
        "created_at": "2024-11-19T15:50:00Z",
        "message": "Let's schedule a meeting.",
        "message_id": "msg125",
        "message_type": "text",
        "receiver_id": "user001",
        "sender_id": "user002"
      },
      {
        "created_at": "2024-11-19T15:55:00Z",
        "message": "10 giây",
        "message_id": "msg126",
        "message_type": "missed_call",
        "receiver_id": "user002",
        "sender_id": "user001"
      },
      {
        "created_at": "2024-11-19T16:00:00Z",
        "message": "Check out this image!",
        "message_id": "msg127",
        "message_type": "image",
        "receiver_id": "user001",
        "sender_id": "user002"
      },
      {
        "created_at": "2024-11-19T16:15:00Z",
        "message": "2 phút 30 giây",
        "message_id": "msg128",
        "message_type": "video_call",
        "receiver_id": "user002",
        "sender_id": "user001"
      },
      {
        "created_at": "2024-11-19T16:20:00Z",
        "message": "This is an example of a long text message to demonstrate variations in content.",
        "message_id": "msg129",
        "message_type": "text",
        "receiver_id": "user001",
        "sender_id": "user002"
      }
    ]
  },
  "error": null,
  "message_en": "Request successful",
  "message_vi": "Yêu cầu thành công",
  "success": true
}
''';
