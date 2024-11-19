import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/chat/output/chat_rooms_output/chat_rooms_output.dart';

part 'chat_rooms_state.g.dart';

@CopyWith()
class ChatRoomsState {
  final bool isLoading;
  final List<ChatRoomsOutput> chatRooms;
  final ChatRoomsOutput? selectedChat;
  final List<File> assets;

  ChatRoomsState({
    this.isLoading = false,
    this.chatRooms = const [],
    this.selectedChat,
    this.assets = const [],
  });
}
