import 'package:flutter/material.dart';
import 'package:task_handler/component/appBottomNav.dart';

class homeScreen extends StatefulWidget{

  const homeScreen({Key? key}):super(key:key);
  
  @override
  State<homeScreen> createState()=> _homeScreenState();
  
}

class _homeScreenState extends State<homeScreen>{


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
    body:Center(),
    bottomNavigationBar: appBottomNav(bottomtabIndex, onItemTapped),
   );
   
  }
}