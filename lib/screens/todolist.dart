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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: todos[index].priority < 5  ?  Colors.green.shade300 : Colors.red.shade200,
              ),
              child: ListTile(
                onTap: () {
                  
                },
                title: Text(todos[index].title),
                subtitle: Text(todos[index].content),
              ),
            ),
          );
        },
      ),
    );
  }
}
