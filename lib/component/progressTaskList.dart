import 'package:flutter/material.dart';
import 'package:task_handler/component/appBottomNav.dart';

class progressTaskList extends StatefulWidget{

  const progressTaskList({Key? key}):super(key:key);
  
  @override
  State<progressTaskList> createState()=> _progressTaskList();
  
}

class _progressTaskList extends State<progressTaskList>{


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
         child:Text("Progress Task List"),
    ),

   );
   
  }
}