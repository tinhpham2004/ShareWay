import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class WebSocketService {
  late WebSocketChannel _channel;
  final String _wsUrl = 'ws://shareway.hungnq.online/ws?user_id=';

  void connect() async {
    final userId = await Preferences.getUserId();
    _channel = WebSocketChannel.connect(Uri.parse('$_wsUrl$userId'));
    _channel.stream.listen(_handleMessage, onError: _handleError, onDone: _handleDone);
  }

  void _handleMessage(dynamic message) {
    final parsedMessage = jsonDecode(message);
    switch (parsedMessage['type']) {
      case 'new-give-ride-request':
        _handleNewGiveRideRequest(parsedMessage['data']);
        break;
      case 'new-hitch-ride-request':
        _handleNewHitchRideRequest(parsedMessage['data']);
        break;
      case 'accepted-give-ride-request':
        _handleAcceptedGiveRideRequest(parsedMessage['data']);
        break;
      case 'accepted-hitch-ride-request':
        _handleAcceptedHitchRideRequest(parsedMessage['data']);
        break;
      case 'cancel-give-ride-request':
        _handleCancelGiveRideRequest(parsedMessage['data']);
        break;
      case 'cancel-hitch-ride-request':
        _handleCancelHitchRideRequest(parsedMessage['data']);
        break;
      default:
        print('Unknown message type: ${parsedMessage['type']}');
    }
  }

  void _handleNewGiveRideRequest(Map<String, dynamic> data) {
    // Display notification with ride offer details
    // You might want to use a state management solution or event bus to update the UI
    print('New give ride request: $data');
  }

  void _handleNewHitchRideRequest(Map<String, dynamic> data) {
    // Display notification with ride request details
    print('New hitch ride request: $data');
  }

  void _handleAcceptedGiveRideRequest(Map<String, dynamic> data) {
    // Update UI to show accepted ride offer
    print('Accepted give ride request: $data');
  }

  void _handleAcceptedHitchRideRequest(Map<String, dynamic> data) {
    // Update UI to show accepted ride request
    print('Accepted hitch ride request: $data');
  }

  void _handleCancelGiveRideRequest(Map<String, dynamic> data) {
    // Update UI to show cancelled ride offer
    print('Cancelled give ride request: $data');
  }

  void _handleCancelHitchRideRequest(Map<String, dynamic> data) {
    // Update UI to show cancelled ride request
    print('Cancelled hitch ride request: $data');
  }

  void _handleError(error) {
    print('WebSocket error: $error');
    // Implement reconnection logic here
  }

  void _handleDone() {
    print('WebSocket connection closed');
    // Implement reconnection logic here
  }

  void dispose() {
    _channel.sink.close();
  }
}