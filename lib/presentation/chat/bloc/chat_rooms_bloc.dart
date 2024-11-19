import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/domain/chat/output/chat_rooms_output/chat_rooms_output.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class ChatRoomsBloc extends Cubit<ChatRoomsState> {
  ChatRoomsBloc() : super(ChatRoomsState());

  final _chatRepository = ChatRepository();

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {
      onFetchChatRooms();
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchChatRooms() async {
    final userId = await Preferences.getUserId();
    if (userId == null) return;

    final chatRooms = await _chatRepository.getChatRooms(userId);
    if (chatRooms != null) {
      emit(state.copyWith(chatRooms: chatRooms));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSelectChat({required BuildContext context, required int index}) {
    emit(state.copyWith(
      selectedChat: state.chatRooms[index],
    ));
    GoRouter.of(context).push(
      AppPath.chatDetail,
      extra: context.read<ChatRoomsBloc>(),
    );
  }

  void onUpdateLastMessage(ChatMessageOutput newMessage) {
    var chatRooms = List<ChatRoomsOutput>.from(state.chatRooms);
    chatRooms = chatRooms.map((chatRoom) {
      if (chatRoom.roomId == state.selectedChat?.roomId) {
        return chatRoom.copyWith(
          lastMessageAt: newMessage.createdAt,
          lastMessage: newMessage.message,
        );
      }
      return chatRoom;
    }).toList();
    emit(state.copyWith(
      chatRooms: chatRooms,
      selectedChat: state.selectedChat?.copyWith(
        lastMessageAt: newMessage.createdAt,
        lastMessage: newMessage.message,
      ),
    ));
  }
}
