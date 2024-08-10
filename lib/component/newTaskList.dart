import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/utility/utility.dart'; // Assuming your storage functions are here

class newTaskList extends StatefulWidget {
  @override
  State<newTaskList> createState() => _newTaskList();
}

class _newTaskList extends State<newTaskList> {
  List Taskitems =[];
  bool Loading = false;

  
  @override 
  initState(){
    callData();
    super.initState();
  }


  callData()async{
    var data = await TaskListRequest("New");
    setState(() {Loading =false; });
    Taskitems = data;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("New List"), // Display the email or fallback message
      ),
    );
  }
}






  // String email = "";

  // @override
  // void initState() {
  //   super.initState();
  //   CallUserData(); // Call the function here to load the user data
  // }

  // CallUserData() async {
  //   String? a = await ReadUserData("email");
  //   setState(() {
  //     email = a ?? "No Email Found";
  //   });
  // }