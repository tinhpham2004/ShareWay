import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/input/init_call_input.dart';
import 'package:share_way_frontend/domain/chat/input/send_image_input.dart';
import 'package:share_way_frontend/domain/chat/input/send_message_input.dart';
import 'package:share_way_frontend/domain/chat/output/chat_message_output/chat_message_output.dart';
import 'package:share_way_frontend/domain/web_socket/web_socket_repository.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class ChatDetailBloc extends Cubit<ChatDetailState> {
  final ChatRoomsBloc chatRoomsBloc;
  final _chatRepository = ChatRepository();
  late WebSocketRepository _webSocketRepository;

  ChatDetailBloc({required this.chatRoomsBloc}) : super(ChatDetailState()) {
    _webSocketRepository = WebSocketRepository(
      onNewTextMessage: onReceiveMessage,
      onNewImageMessage: onReceiveImage,
    );
    _webSocketRepository.connect();
  }

  void onStart() {
    final messageController = TextEditingController();
    emit(state.copyWith(messageController: messageController));
    try {
      onFetchChatMessages();
    } catch (e) {
      print(e);
    }
  }

  void onFetchChatMessages() async {
    emit(state.copyWith(isLoading: true));
    final roomId = chatRoomsBloc.state.selectedChat?.roomId;
    if (roomId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final response = await _chatRepository.getChatMessages(roomId);

    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(state.copyWith(messages: response, isLoading: false));
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSendMessage(BuildContext context) async {
    if (state.messageController?.text.isEmpty ?? true) {
      return;
    }
    emit(state.copyWith(isSendingMessage: true));
    final input = SendMessageInput(
      message: state.messageController?.text ?? '',
      roomId: chatRoomsBloc.state.selectedChat?.roomId ?? '',
      receiverId: chatRoomsBloc.state.selectedChat?.receiver?.id ?? '',
    );

    state.messageController?.clear();

    final response = await _chatRepository.sendMessage(input);
    if (response == null) {
      emit(state.copyWith(isSendingMessage: false));
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }

    final messages = List<ChatMessageOutput>.from(state.messages);

    messages.add(response);

    chatRoomsBloc.onUpdateLastMessage(response);

    emit(state.copyWith(messages: messages, isSendingMessage: false));
  }

  void onSelectImage(File? image) async {
    emit(state.copyWith(selectedImage: image));
  }

  void onSendImage(BuildContext context) async {
    emit(state.copyWith(isSendingMessage: true));

    GoRouter.of(context).pop();

    final input = SendImageInput(
      roomId: chatRoomsBloc.state.selectedChat?.roomId ?? '',
      image: state.selectedImage!,
      receiverId: chatRoomsBloc.state.selectedChat?.receiver?.id ?? '',
    );
    final response = await _chatRepository.sendImage(input);

    if (response == null) {
      emit(state.copyWith(isSendingMessage: false));
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }

    final messages = List<ChatMessageOutput>.from(state.messages);

    messages.add(response);

    chatRoomsBloc.onUpdateLastMessage(response.copyWith(message: 'Hình ảnh'));

    emit(state.copyWith(messages: messages, isSendingMessage: false));
  }

  void onReceiveMessage(ChatMessageOutput message) {
    final messages = List<ChatMessageOutput>.from(state.messages);
    messages.add(message);

    chatRoomsBloc.onUpdateLastMessage(message);

    emit(state.copyWith(messages: messages));
  }

  void onReceiveImage(ChatMessageOutput message) {
    final messages = List<ChatMessageOutput>.from(state.messages);
    messages.add(message);

    chatRoomsBloc.onUpdateLastMessage(message.copyWith(message: 'Hình ảnh'));

    emit(state.copyWith(messages: messages));
  }

  void onInitCall(BuildContext context) async {
    emit(state.copyWith(isSendingCall: true));
    final input = InitCallInput(
      chatRoomId: chatRoomsBloc.state.selectedChat?.roomId ?? '',
      receiverId: chatRoomsBloc.state.selectedChat?.receiver?.id ?? '',
      expireTime: 3600,
    );

    final response = await _chatRepository.initCall(input);

    if (response == null) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      emit(state.copyWith(isSendingCall: false));
      return;
    }

    GoRouter.of(context).go(AppPath.call, extra: response);

    emit(state.copyWith(isSendingCall: false));
  }
}
