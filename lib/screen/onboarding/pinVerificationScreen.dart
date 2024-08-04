import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class pinVerificationScreen extends StatefulWidget{
  @override
  State<pinVerificationScreen> createState() =>  _pinVerificationScreen();
}


class _pinVerificationScreen extends State<pinVerificationScreen>{

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