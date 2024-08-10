import 'package:flutter/material.dart';
import 'package:task_handler/component/appBottomNav.dart';
import 'package:task_handler/component/cancelTaskList.dart';
import 'package:task_handler/component/completedTask.dart';
import 'package:task_handler/component/newTaskList.dart';
import 'package:task_handler/component/progressTaskList.dart';

class homeScreen extends StatefulWidget{

  const homeScreen({Key? key}):super(key:key);
  
  @override
  State<homeScreen> createState()=> _homeScreenState();
  
}

class _homeScreenState extends State<homeScreen>{


  int TabIndex =0;
  onItemTapped(index){
    setState(() {
      TabIndex=index;
    });
  }

  final widgetOptions=[
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList()
  ];


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body:widgetOptions.elementAt(TabIndex),
    bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
   );
   
  }
}