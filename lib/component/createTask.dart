import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/appBottomNav.dart';

class createTaskList extends StatefulWidget{

  const createTaskList({Key? key}):super(key:key);
  
  @override
  State<createTaskList> createState()=> _createTaskList();
  
}

class _createTaskList extends State<createTaskList>{


  int bottomtabIndex =0;
  onItemTapped(index){
    setState(() {
      bottomtabIndex=index;
    });
  }


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
    appBar: AppBar(),
    body:Center(
      child: Text("Create Task List"),
    ),
   
   );
   
  }
}