import 'package:flutter/material.dart';
import 'package:todo_mobile/components/todotextfield.dart';

class TodoAdd extends StatelessWidget {
  final TextEditingController controllerTitle;
  final TextEditingController controllerContent;
  final TextEditingController controllerPriority;

  const TodoAdd(
      {Key key,
      this.controllerTitle,
      this.controllerContent,
      this.controllerPriority})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [

          TodoTextField(title: "Please Enter Todo Title",controller: controllerTitle,),
          
          SizedBox(
            height: 15,
          ),

          TodoTextField(title: "Please Enter Todo Content",controller: controllerContent, lines: 3, ),
          SizedBox(
            height: 15,
          ),
          TodoTextField(title: "Please Enter Todo Priority (0 - 9)", controller: controllerPriority, length: 1, inputType: TextInputType.number,),
        ],
      ),
    );
  }
}
