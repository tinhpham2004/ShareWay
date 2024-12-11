import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/domain/chat/output/chat_rooms_output/chat_rooms_output.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class ChatRoomsBloc extends Cubit<ChatRoomsState> {
  ChatRoomsBloc() : super(ChatRoomsState());

  Timer? _debounce;
  final _chatRepository = ChatRepository();

  void onStart(BuildContext context) {
    try {
      onFetchAssets(context);
      onFetchChatRooms();
    } catch (e) {
      // TODO: Add onboarding logic
    }
  }

  void onFetchAssets(BuildContext context) async {
    try {
      final permission = await PhotoManager.requestPermissionExtend();
      if (permission.isAuth) {
        final albums =
            await PhotoManager.getAssetPathList(type: RequestType.image);
        if (albums.isNotEmpty) {
          final recentAlbum = albums.first;
          final assetListRange =
              await recentAlbum.getAssetListRange(start: 0, end: 100);

          // Fetch files concurrently
          final futures = assetListRange.map((asset) => asset.file);
          final files = await Future.wait(futures);

          final assets = files.whereType<File>().toList();
          emit(state.copyWith(assets: assets));
        }
      }
    } catch (e) {
      print(e);
    }

    // else{
    //   showErrorSnackbar(context, permission.name);
    // }
  }

  Future<void> onFetchChatRooms() async {
    emit(state.copyWith(isLoading: true));
    try {
      final userId = await Preferences.getUserId();
      if (userId == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final chatRooms = await _chatRepository.getChatRooms(userId);
      if (chatRooms != null) {
        emit(state.copyWith(chatRooms: chatRooms));
      }
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(isLoading: false));
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

  Future<void> onSearchUsers(String searchInput) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () async {
      emit(state.copyWith(isLoading: true));
      final chatRooms = await _chatRepository.searchUsers(searchInput);
      if (chatRooms != null) {
        emit(state.copyWith(chatRooms: chatRooms));
      }
      emit(state.copyWith(isLoading: false));
    });
  }
}
