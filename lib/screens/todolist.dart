import 'package:flutter/material.dart';
import 'package:todo_mobile/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].content),
          );
        },
      ),
    );
  }
}
