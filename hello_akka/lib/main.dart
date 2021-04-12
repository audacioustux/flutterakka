import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/todo.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AloPoc',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _msgs = <String>[];

  @override
  void initState() {
    super.initState();
    Todo.eventBus.on().listen((event) {
        print(event.msg);
        setState(() {
            _msgs = [..._msgs, event.msg];
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: _msgs.map((v) => Text(v)).toList(),
          )
        ),
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Text('Ping'),
            onPressed: Todo.ping,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Text('Pong'),
            onPressed: Todo.pong,
          )
        ]
      )
    );
  }
}
