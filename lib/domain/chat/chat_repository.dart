import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/api/chat/chat_service.dart';
import 'package:share_way_frontend/data/api/chat/request/init_call_request/init_call_request.dart';
import 'package:share_way_frontend/data/api/chat/request/send_image_request/send_image_request.dart';
import 'package:share_way_frontend/data/api/chat/request/send_message_request/send_message_request.dart';
import 'package:share_way_frontend/data/api/chat/request/update_call_request/update_call_request.dart';
import 'package:share_way_frontend/domain/chat/input/init_call_input.dart';
import 'package:share_way_frontend/domain/chat/input/send_image_input.dart';
import 'package:share_way_frontend/domain/chat/input/send_message_input.dart';
import 'package:share_way_frontend/domain/chat/input/update_call_input.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/domain/chat/output/chat_rooms_output/chat_rooms_output.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';

class ChatRepository {
  final _service = ChatService();

  Future<List<ChatRoomsOutput>?> getChatRooms(String userId) async {
    try {
      final response = await _service.getChatRooms(userId);
      if (response != null) {
        return response.data?.chatRooms
            ?.map((e) => ChatRoomsOutput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<List<ChatRoomsOutput>?> searchUsers(String searchInput) async {
    try {
      final response = await _service.searchUsers(searchInput);
      if (response != null) {
        return response.data?.chatRooms
            ?.map((e) => ChatRoomsOutput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<List<ChatMessageOutput>?> getChatMessages(String roomId) async {
    try {
      final response = await _service.getChatMessages(roomId);
      if (response != null) {
        return response.data?.messages
            ?.map((e) => ChatMessageOutput.fromApiModel(e))
            .toList();
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<ChatMessageOutput?> sendMessage(SendMessageInput input) async {
    try {
      final response =
          await _service.sendMessage(SendMessageRequest.toApiModel(input));
      if (response != null) {
        return ChatMessageOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<ChatMessageOutput?> sendImage(SendImageInput input) async {
    try {
      final response =
          await _service.sendImage(SendImageRequest.toApiModel(input));
      if (response != null) {
        return ChatMessageOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<InitCallOutput?> initCall(InitCallInput input) async {
    try {
      final response =
          await _service.initCall(InitCallRequest.toApiModel(input));
      if (response != null) {
        return InitCallOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }

  Future<ChatMessageOutput?> updateCallStatus(UpdateCallInput input) async {
    try {
      final response =
          await _service.updateCallStatus(UpdateCallRequest.toApiModel(input));
      if (response != null) {
        return ChatMessageOutput.fromApiModel(response);
      }
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
    return null;
  }
}
