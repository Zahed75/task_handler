import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/appBottomNav.dart';

class cancelTaskList extends StatefulWidget{

  const cancelTaskList({Key? key}):super(key:key);
  
  @override
  State<cancelTaskList> createState()=> _cancelTaskList();
  
}

class _cancelTaskList extends State<cancelTaskList>{


    List Taskitems =[];
  bool Loading = false;

  
  @override 
  initState(){
    callData();
    super.initState();
  }


  callData()async{
    var data = await TaskListRequest("Cancelled");
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
      child: Text("Cancel Task List"),
    ),
   
   );
   
  }
}