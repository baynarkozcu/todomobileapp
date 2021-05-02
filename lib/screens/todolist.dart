import 'package:flutter/material.dart';
import 'package:todo_mobile/models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  _areYouSure(Todo todo) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Todo is Deleting ??"),
              content: Text("Are You Sure You Want to Delete the Todo ?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  color: Colors.red.shade700,
                  child: Text("Delete"),
                  onPressed: () {
                    setState(() {
                      widget.todos.remove(todo);
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: widget.todos.length == 0
          ? Center(
              child: Text("There is nothing to do"),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: widget.todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: widget.todos[index].priority <= 4
                            ? Colors.green.shade300
                            : Colors.red.shade200,
                      ),
                      child: ListTile(
                        onTap: () {},
                        title: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            widget.todos[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              widget.todos[index].content,
                              style: TextStyle(color: Colors.white),
                            )),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => _areYouSure(widget.todos[index]),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
