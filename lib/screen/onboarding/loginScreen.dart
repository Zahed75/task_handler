import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class loginScreen extends StatefulWidget{
  @override
  State<loginScreen> createState() =>  _loginScreen();
}


class _loginScreen extends State<loginScreen>{

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