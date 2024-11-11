import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/cancel_ride_request/cancel_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request_data.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:convert';

class WebSocketRepository {
  late WebSocketChannel _channel;
  final String _wsUrl = 'ws://shareway.hungnq.online/ws';

  // final void Function(NewGiveRideRequestData)? onNewGiveRideRequest;
  final void Function(NewHitchRideRequestData)? onNewHitchRideRequest;
  final void Function(AcceptRideRequestData)? onAcceptGiveRideRequest;
  final void Function(AcceptRideRequestData)? onAcceptHitchRideRequest;
  final void Function(CancelRideRequestData)? onCancelGiveRideRequest;
  final void Function(CancelRideRequestData)? onCancelHitchRideRequest;

  WebSocketRepository({
    // this.onNewGiveRideRequest,
    this.onNewHitchRideRequest,
    this.onAcceptGiveRideRequest,
    this.onAcceptHitchRideRequest,
    this.onCancelGiveRideRequest,
    this.onCancelHitchRideRequest,
  });

  void connect() async {
    final userId = await Preferences.getUserId();
    print('Connecting to WebSocket with user ID: $userId');
    _channel = WebSocketChannel.connect(Uri.parse('$_wsUrl?user_id=$userId'));
    _channel.stream
        .listen(_handleMessage, onError: _handleError, onDone: _handleDone);
  }

  void _handleMessage(dynamic message) {
    final model = jsonDecode(message);
    final type = model['type'];
    final data = model['data'];
    switch (type) {
      case 'new-give-ride-request':
        // if (onNewGiveRideRequest != null) {
        //   final newGiveRideRequestData = NewGiveRideRequestData.fromJson(data);
        //   onNewGiveRideRequest!(newGiveRideRequestData);
        // }
        break;
      case 'new-hitch-ride-request':
        if (onNewHitchRideRequest != null) {
          final newHitchRideRequestData =
              NewHitchRideRequestData.fromJson(data);
          onNewHitchRideRequest!(newHitchRideRequestData);
        }
        break;
      case 'accepted-give-ride-request':
        if (onAcceptGiveRideRequest != null) {
          final acceptRideRequestData = AcceptRideRequestData.fromJson(data);
          onAcceptGiveRideRequest!(acceptRideRequestData);
        }
        break;
      case 'accepted-hitch-ride-request':
        if (onAcceptHitchRideRequest != null) {
          final acceptRideRequestData = AcceptRideRequestData.fromJson(data);
          onAcceptHitchRideRequest!(acceptRideRequestData);
        }
        break;
      case 'cancel-give-ride-request':
        if (onCancelGiveRideRequest != null) {
          final cancelRideRequestData = CancelRideRequestData.fromJson(data);
          onCancelGiveRideRequest!(cancelRideRequestData);
        }
        break;
      case 'cancel-hitch-ride-request':
        if (onCancelHitchRideRequest != null) {
          final cancelRideRequestData = CancelRideRequestData.fromJson(data);
          onCancelHitchRideRequest!(cancelRideRequestData);
        }
        break;
      default:
        print('Unknown message type: ${type}');
    }
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
