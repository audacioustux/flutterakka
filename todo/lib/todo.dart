import 'dart:async';

import 'package:flutter/services.dart';
import 'package:event_bus/event_bus.dart';

class PingEvent {
    String msg;
    PingEvent(this.msg);
}

class PongEvent {
    String msg;
    PongEvent(this.msg);
}

class Todo {
  static EventBus eventBus = EventBus();

  static const MethodChannel _channel =
      const MethodChannel('todo');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void ping() async {
    _channel.invokeMethod('ping');
  }

  static void pong() async {
    _channel.invokeMethod('pong');
  }
}
