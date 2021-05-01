import 'package:flutter/material.dart';

class TodoAdd extends StatelessWidget {
  final TextEditingController controllerTitle;
  final TextEditingController controllerContent;
  final TextEditingController controllerPriority;

  const TodoAdd({Key key, this.controllerTitle, this.controllerContent, this.controllerPriority}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          TextField(
            controller: controllerTitle,
            decoration: InputDecoration(
                hintText: "Please Enter Todo Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: controllerContent,
            decoration: InputDecoration(
                hintText: "Please Enter Todo Content",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: controllerPriority,
            decoration: InputDecoration(
                hintText: "Please Enter Todo Priority (1 - 10)",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
