import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class emailVerificationScreen extends StatefulWidget{
  @override
  State<emailVerificationScreen> createState() =>  _emailVerificationScreen();
}


class _emailVerificationScreen extends State<emailVerificationScreen>{

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