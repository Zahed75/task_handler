import 'package:flutter/material.dart';

class taskCreateScreen extends StatefulWidget{

  const taskCreateScreen({Key? key}):super(key:key);
  
  @override
  State<taskCreateScreen> createState()=> _taskCreateScreen();
  
}

class _taskCreateScreen extends State<taskCreateScreen>{
  @override
  Widget build(BuildContext context) {
   return Container(
      child: Text("Hello"),
   );
   
  }
}