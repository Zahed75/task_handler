import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class registrationScreen extends StatefulWidget{
  @override
  State<registrationScreen> createState() =>  _registrationScreen();
}


class _registrationScreen extends State<registrationScreen>{

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