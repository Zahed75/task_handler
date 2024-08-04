import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class setPasswordScreen extends StatefulWidget{
  @override
  State<setPasswordScreen> createState() =>  _setPasswordScreen();
}


class _setPasswordScreen extends State<setPasswordScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Container(
          color:Colors.orange,
          child:Center(
            child: Text('Best Electronics',style: TextStyle(
              fontSize: 34,
              color:Colors.white,
              fontWeight: FontWeight.w700,
              
            ),),
            ),
        ),
    );
  }
}