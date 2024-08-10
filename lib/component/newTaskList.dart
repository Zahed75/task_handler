import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/taskList.dart';
import 'package:task_handler/utility/utility.dart'; // Assuming your storage functions are here

class newTaskList extends StatefulWidget {
  @override
  State<newTaskList> createState() => _newTaskList();
}

class _newTaskList extends State<newTaskList> {
  List Taskitems = [];
  bool Loading = true; // Set Loading to true initially

  @override
  void initState() {
    super.initState();
    callData(); // Fetch the data when the widget is initialized
  }

  callData() async {
    var data = await TaskListRequest("New");
    setState(() {
      Loading = false; // Set Loading to false after data is fetched
      Taskitems = data; // Update the Taskitems list
    });
  }

  @override
  Widget build(BuildContext context) {
      
      return Loading?(Center(child: CircularProgressIndicator(),)):RefreshIndicator(
        
        onRefresh:()async{
          callData();
        }, 
        child:TaskList(Taskitems),
        );
  }
}
