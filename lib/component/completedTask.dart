import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/appBottomNav.dart';

class completedTaskList extends StatefulWidget{

  const completedTaskList({Key? key}):super(key:key);
  
  @override
  State<completedTaskList> createState()=> _completedTaskList();
  
}

class _completedTaskList extends State<completedTaskList>{



  List Taskitems =[];
  bool Loading = false;

  
  @override 
  initState(){
    callData();
    super.initState();
  }


  callData()async{
    var data = await TaskListRequest("Completed");
    setState(() {Loading =false; });
    Taskitems = data;
  }


  int bottomtabIndex =0;
  onItemTapped(index){
    setState(() {
      bottomtabIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body:Center(
      child: Text("Completed Task List"),
    ),
    
   );
   
  }
}