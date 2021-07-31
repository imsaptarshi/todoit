import 'package:flutter/material.dart';

import 'widgets/task.dart';
import 'widgets/text_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todoit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];
  int currId = 0;

  void changeText(String text) {
    setState(() {
      this.tasks.add(Task(text, this.currId, this.deleteTask));
      this.currId += 1;
    });
  }

  void deleteTask(int id) {
    setState(() {
      for (int i = 0; i < tasks.length; i++) {
        if (id == this.tasks[i].id) {
          this.tasks.removeAt(i);
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todoit"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[TextInputWidget(this.changeText), ...this.tasks],
      )),
    );
  }
}
