import 'package:flutter/material.dart';
import 'package:task_handler/component/appBottomNav.dart';
import 'package:task_handler/component/appTaskBar.dart';
import 'package:task_handler/component/cancelTaskList.dart';
import 'package:task_handler/component/completedTask.dart';
import 'package:task_handler/component/newTaskList.dart';
import 'package:task_handler/component/progressTaskList.dart';
import 'package:task_handler/utility/utility.dart';


class homeScreen extends StatefulWidget{

  const homeScreen({Key? key}):super(key:key);
  
  @override
  State<homeScreen> createState()=> _homeScreenState();
  
}

class _homeScreenState extends State<homeScreen>{


  int TabIndex =0;
  Map<String,String>ProfileData ={"email":"","firstName":"","lastName":"","mobile":"","photo":defaultProfilePic};



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


  ReadProfileData()async{
   String? email = await ReadUserData("email");
   String? firstName = await ReadUserData("firstName");
   String? lastName = await ReadUserData("lastName");
   String? photo = await ReadUserData("photo");

   setState(() {
     ProfileData ={"email":"$email","firstName":"$firstName","lastName":"$lastName","photo":"$photo"};
   });

  }
@override
void initState(){
  ReadProfileData();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: TaskAppBar(context,ProfileData),
    body:widgetOptions.elementAt(TabIndex),
    bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
   );
   
  }
}