import 'package:flutter/material.dart';
import 'package:todo_mobile/models/todo.dart';
import 'package:todo_mobile/screens/addtodo.dart';
import 'package:todo_mobile/screens/todolist.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerContent = TextEditingController();
  TextEditingController _controllerPriority = TextEditingController();
  List<Todo> _todos = [
    Todo(title: "sad", content: "sadsad sa d d dad", priority: 6),
  ];

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Add  Todo"),
              content: TodoAdd(
                controllerTitle: _controllerTitle,
                controllerContent: _controllerContent,
                controllerPriority: _controllerPriority,
              ),
              actions: <Widget>[
                FlatButton(
                  color: Colors.red,
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Add'),
                  onPressed: () {
                    setState(() {
                      _todos.add(Todo(
                          title: _controllerTitle.text,
                          content: _controllerContent.text,
                          priority: int.parse(_controllerPriority.text)));
                    });

                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  bool search = false;
  String searchKey="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.pink.shade200,
          title: search == false
              ? Text("TodoList")
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchKey = value;
                      });
                      
                    },
                  ),
                ),
          centerTitle: true,
          leading: Padding(
              padding: EdgeInsets.only(left: 25), child: Icon(Icons.menu)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  if (search) {
                    search = false;
                  } else {
                    search = true;
                  }
                  setState(() {});
                },
                child: Icon(
                  search ? Icons.cancel : Icons.search,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMaterialDialog();
          },
          backgroundColor: Colors.pink.shade200,
          child: Icon(
            Icons.add,
          ),
        ),
        body: TodoList(
          todos: _todos,
          searchKey: searchKey,
          search: search,
          
        ));
  }
}
