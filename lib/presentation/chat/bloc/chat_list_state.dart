import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/chat/models/chat_model/chat_model_data.dart';

part 'chat_list_state.g.dart';

@CopyWith()
class ChatListState {
  final bool isLoading;
  final List<ChatModelData> chatList;

  ChatListState({
    this.isLoading = false,
    this.chatList = const [],
  });
}
