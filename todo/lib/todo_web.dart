import 'dart:async';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'pingpong.dart';

class TodoWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'todo',
      const StandardMethodCodec(),
      registrar,
    );

    initPingPong();

    final pluginInstance = TodoWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      case 'ping':
        return ping();
      case 'pong':
        return pong();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'todo for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<String> getPlatformVersion() { 
    final version = html.window.navigator.userAgent;
    return Future.value(version);
  }
}
