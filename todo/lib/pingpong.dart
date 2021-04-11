@JS('PingPong')
library pingpong.js;

import 'package:import_js_library/import_js_library.dart';
import 'package:js/js.dart';

void initPingPong() {
    importJsLibrary(url: "./assets/pingpong.js", flutterPluginName: "todo");
}

@JS('ping')
external ping();
@JS('pong')
external pong();

// @JS('JSON.stringify')
// external String start(Object obj);
