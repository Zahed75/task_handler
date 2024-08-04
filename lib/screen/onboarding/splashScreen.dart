import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_handler/screen/onboarding/loginScreen.dart';



class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() =>  _SplashScreen();
}


class _SplashScreen extends State<SplashScreen>{

  @override

  void initState(){
      Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen(),));
    });
     super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
        body:Container(
          color:Colors.orange,
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Best Electronics',style: TextStyle(
                //   fontSize: 34,
                //   color:Colors.white,
                //   fontWeight: FontWeight.w700,
                  
                // ),),
                Image.asset(
                  'assets/images/logo.png',
                  width: 320,
                  fit:BoxFit.cover,
                  color:Colors.white,

                ),
                SizedBox(height: 10,),
                Text('Task Management for the Best Battalions',style:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color:Colors.white,
                  fontFamily: AutofillHints.familyName
                ),),
              ],
            ),
            
            ),
        ),
    );
  }
}