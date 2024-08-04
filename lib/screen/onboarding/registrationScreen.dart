import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/style/style.dart';




class registrationScreen extends StatefulWidget{
  @override
  State<registrationScreen> createState() =>  _registrationScreen();
}


class _registrationScreen extends State<registrationScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join With US",style: Head1Text(colorDarkBlue),),
                SizedBox(height:2,),
                TextFormField(decoration: AppInputDecoration("Email Address"),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("First Name"),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("Last Name"),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("Mobile"),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                   SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                SizedBox(height: 2,),
                Container(
                    child:ElevatedButton(
                      style: AppButtonStyle(),
                      child:SuccessButtonChild('Registration'),
                      onPressed: (){

                      },
                      ),
                )
              ],
            ),
          ),
        ],
        ),
    );
  }
}