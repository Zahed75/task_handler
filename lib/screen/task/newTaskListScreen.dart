import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/style/style.dart';




class newTaskListScreen extends StatefulWidget{
  @override
  State<newTaskListScreen> createState() =>  _newTaskListScreen();
}


class _newTaskListScreen extends State<newTaskListScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Text("New Task List")
        ),
    );
  }
}