import 'package:flutter/material.dart';
import 'package:todo_mobile/models/todo.dart';
import 'package:todo_mobile/screens/todolist.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerContent = TextEditingController();
  TextEditingController controllerPriority = TextEditingController();
  List<Todo> _todos = [
    Todo(title: "Deneme Başlık", content: "Deneme içerikkkk", priority: 2)
  ];

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Add  Todo"),
              content: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
      children: [
        TextField(
          controller: controllerTitle,
          decoration: InputDecoration(
              hintText: "Please Enter Todo Title",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: controllerContent,
          decoration: InputDecoration(
              hintText: "Please Enter Todo Content",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controllerPriority,
          decoration: InputDecoration(
              hintText: "Please Enter Todo Priority",
              
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
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
                          title: controllerTitle.text,
                          content: controllerContent.text,
                          priority: int.parse(controllerPriority.text)));
                    });

                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.pink.shade200,
        title: Text("TodoList"),
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsets.only(left: 25), child: Icon(Icons.menu)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.search,
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
      body: TodoList(todos: _todos,)
    );
  }
}
