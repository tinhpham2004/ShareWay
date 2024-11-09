import 'dart:async';

import 'package:share_way_frontend/data/api/web_socket/web_socket_service.dart';

class WebSocketRepository {
  final _webSocketService = WebSocketService();

  void connect() {
    _webSocketService.connect();
  }

  void dispose() {
    _webSocketService.dispose();
  }
}
