import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() =>  _SplashScreen();
}


class _SplashScreen extends State<SplashScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Container(
          color:Colors.orange,
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Best Electronics',style: TextStyle(
                  fontSize: 34,
                  color:Colors.white,
                  fontWeight: FontWeight.w700,
                  
                ),),
                SizedBox(height: 10,),
                Text('Task Management for the Best Battalions',style:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color:Colors.white
                ),),
              ],
            ),
            
            ),
        ),
    );
  }
}