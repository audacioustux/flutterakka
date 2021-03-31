import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/todo.dart';

void main() {
  const MethodChannel channel = MethodChannel('todo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Todo.platformVersion, '42');
  });
}
