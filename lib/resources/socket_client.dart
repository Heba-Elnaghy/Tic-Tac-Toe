import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('https://tic-tac-toe-server-rust.vercel.app/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
    });
    socket!.connect();
    socket!.onConnect((_) {
      debugPrint('Socket connected successfully!');
    });

    socket!.onDisconnect((_) {
      debugPrint('Socket disconnected!');
    });

    socket!.onError((error) {
      debugPrint('Socket error: $error');
    });

    socket!.onAny((event, data) => print(data));
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
