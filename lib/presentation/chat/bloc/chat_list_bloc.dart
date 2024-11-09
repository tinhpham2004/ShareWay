import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_list_state.dart';
import 'package:share_way_frontend/presentation/chat/models/chat_model/chat_model.dart';

class ChatListBloc extends Cubit<ChatListState> {
  ChatListBloc() : super(ChatListState());

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {
      var jsonData = '''
{
    "data": [
        {
            "id": "1",
            "name": "Dianne Russell",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": true
        },
        {
            "id": "2",
            "name": "Robert Fox",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": false
        },
        {
            "id": "3",
            "name": "Ralph Edwards",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": true
        },
        {
            "id": "4",
            "name": "Floyd Miles",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": true
        },
        {
            "id": "5",
            "name": "Darrell Steward",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": true
        },
        {
            "id": "6",
            "name": "Arlene McCoy",
            "last_message": "Perfect, will check it",
            "time": "2034-11-08T21:34:00Z",
            "is_online": true
        }
    ]
}
''';
      final chatList = ChatModel.fromJson(jsonDecode(jsonData)).data;
      emit(state.copyWith(chatList: chatList));
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onBack(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
