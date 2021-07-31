import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String text;
  final int id;
  final Function(int) deleteCallback;

  const Task(this.text, this.id, this.deleteCallback);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isDone = false;

  void delete(int id) {
    widget.deleteCallback(id);
  }

  void done(int id) {
    setState(() {
      isDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.fromLTRB(0, 0, 0, 2),
        width: double.infinity,
        color: Colors.black12,
        padding: new EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Container(
                      child: Row(children: <Widget>[
                IconButton(
                    icon: Icon(Icons.done),
                    splashColor: Colors.blue,
                    onPressed: () => this.done(widget.id),
                    tooltip: "Mark task done"),
                RichText(
                    text: TextSpan(
                        text: widget.text,
                        style: TextStyle(
                            decoration:
                                isDone ? TextDecoration.lineThrough : null,
                            color: Colors.black)))
              ]))),
              IconButton(
                  icon: Icon(Icons.delete),
                  splashColor: Colors.black,
                  onPressed: () => this.delete(widget.id),
                  tooltip: "Delete task")
            ]));
  }
}
