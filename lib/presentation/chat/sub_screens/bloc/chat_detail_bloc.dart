import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/input/send_image_input.dart';
import 'package:share_way_frontend/domain/chat/input/send_message_input.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/bloc/chat_detail_state.dart';

class ChatDetailBloc extends Cubit<ChatDetailState> {
  final ChatRoomsBloc chatRoomsBloc;
  final _chatRepository = ChatRepository();
  ChatDetailBloc({required this.chatRoomsBloc}) : super(ChatDetailState());

  void onStart() {
    final messageController = TextEditingController();
    emit(state.copyWith(isLoading: true, messageController: messageController));
    try {
      onFetchChatMessages();
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchChatMessages() async {
    final roomId = chatRoomsBloc.state.selectedChat?.roomId;
    if (roomId == null) {
      return;
    }
    final response = await _chatRepository.getChatMessages(roomId);

    if (response == null) {
      return;
    }

    emit(state.copyWith(messages: response));
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSendMessage(BuildContext context) async {
    final input = SendMessageInput(
      message: state.messageController?.text ?? '',
      roomId: chatRoomsBloc.state.selectedChat?.roomId ?? '',
      receiverId: chatRoomsBloc.state.selectedChat?.receiver?.id ?? '',
    );

    state.messageController?.clear();

    final response = await _chatRepository.sendMessage(input);
    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }

    final messages = List<ChatMessageOutput>.from(state.messages);

    messages.add(response);

    chatRoomsBloc.onUpdateLastMessage(response);

    emit(state.copyWith(messages: messages));
  }

  void onSelectImage(File? image) async {
    emit(state.copyWith(selectedImage: image));
  }

  void onSendImage(BuildContext context) async {
    if (state.selectedImage == null) {
      showErrorSnackbar(context, 'Vui lòng chọn ảnh');
      return;
    }
    final input = SendImageInput(
      roomId: chatRoomsBloc.state.selectedChat?.roomId ?? '',
      image: state.selectedImage!,
      receiverId: chatRoomsBloc.state.selectedChat?.receiver?.id ?? '',
    );
    final response = await _chatRepository.sendImage(input);
    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }

    final messages = List<ChatMessageOutput>.from(state.messages);

    messages.add(response);

    chatRoomsBloc.onUpdateLastMessage(response);

    emit(state.copyWith(messages: messages));

    GoRouter.of(context).pop();
  }
}
