import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketService {
  late StompClient stompClient;

  WebSocketService({required void Function(StompFrame) onConnect}) {
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'http://10.0.2.2:9098/ws',
        onConnect: onConnect,
        onStompError: (StompFrame frame) {
          print('STOMP Error: ${frame.body}');
        },
        onWebSocketError: (dynamic error) {
          print('WebSocket Error: $error');
        },
        onDisconnect: (frame) {
          print('Disconnected: ${frame.body}');
        },
        heartbeatOutgoing: const Duration(seconds: 10),
        heartbeatIncoming: const Duration(seconds: 10),
      ),
    );
  }

  void sendMessage(String message) {
    stompClient.send(
      destination: '/app/sendNotification',
      body: message,
    );
  }

  void dispose() {
    stompClient.deactivate();
  }

  void activate() {
    stompClient.activate();
  }
}
