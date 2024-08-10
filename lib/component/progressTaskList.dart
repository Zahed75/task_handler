import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/appBottomNav.dart';
import 'package:task_handler/component/taskList.dart';



class progressTaskList extends StatefulWidget{

  const progressTaskList({Key? key}):super(key:key);
  
  @override
  State<progressTaskList> createState()=> _progressTaskList();
  
}


class _progressTaskList extends State<progressTaskList> {
  List Taskitems = [];
  bool Loading = true; // Set Loading to true initially

  @override
  void initState() {
    super.initState();
    callData(); // Fetch the data when the widget is initialized
  }

  callData() async {
    var data = await TaskListRequest("New");
    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      Loading = false; // Set Loading to false after data is fetched
      Taskitems = data; // Update the Taskitems list
    });
  }

  int bottomtabIndex = 0;
  onItemTapped(index) {
    setState(() {
      bottomtabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              callData();
            },
            child: TaskList(Taskitems),
          );
  }
}
