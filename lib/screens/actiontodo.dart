import 'package:flutter/material.dart';
import 'package:todo_mobile/models/todo.dart';

class ActionTodo extends StatefulWidget {
  @override
  _ActionTodoState createState() => _ActionTodoState();
}

class _ActionTodoState extends State<ActionTodo> {
  final List<Todo> todos;
  final TextEditingController controllerTitle;
  final TextEditingController controllerContent;
  final TextEditingController controllerPriority;

  _ActionTodoState(
      {this.todos,
      this.controllerTitle,
      this.controllerContent,
      this.controllerPriority});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Add'),
      onPressed: () {
        setState(() {
          todos.add(Todo(
              title: controllerTitle.text,
              content: controllerContent.text,
              priority: int.parse(controllerPriority.text)));
        });

        Navigator.of(context).pop();
      },
    );
  }
}
