import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final int lines;
  final int length;
  final TextInputType inputType;

  const TodoTextField({Key key, this.controller, this.title, this.lines, this.length, this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: length,
      maxLines: lines,
      decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
