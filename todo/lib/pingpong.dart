@JS('PingPong')
library pingpong.js;

import 'package:import_js_library/import_js_library.dart';
import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:flutter/services.dart';
import 'todo.dart';

void _cast(String event, String msg) {
  switch(event) {
      case "ping": 
        Todo.eventBus.fire(PingEvent(msg));
        break;
      case "pong":
        Todo.eventBus.fire(PongEvent(msg));
        break;
  }
}

void initPingPong() {
    importJsLibrary(url: "./assets/pingpong.js", flutterPluginName: "todo");
    setProperty(window, '_cast', allowInterop(_cast));
}

@JS('ping')
external ping();
@JS('pong')
external pong();
