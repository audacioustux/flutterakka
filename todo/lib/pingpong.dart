@JS()
library pingpong.js;

import 'package:import_js_library/import_js_library.dart';
import 'package:js/js.dart';

void initPingPong() {
    importJsLibrary(url: "./assets/pingpong.js", flutterPluginName: "todo");
}

@JS('PingPong.start')
external void start(int duration);

// @JS('JSON.stringify')
// external String start(Object obj);
