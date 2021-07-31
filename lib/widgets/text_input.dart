import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  const TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click(String value) {
    if (value != "") {
      widget.callback(value);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.task_alt),
            labelText: "New Task...",
            suffixIcon: IconButton(
              icon: Icon(Icons.add),
              splashColor: Colors.blue,
              onPressed: () => this.click(this.controller.text),
              tooltip: "Add New Task",
            )));
  }
}
