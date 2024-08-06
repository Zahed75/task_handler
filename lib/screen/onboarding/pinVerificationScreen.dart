import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_handler/style/style.dart';




class pinVerificationScreen extends StatefulWidget{
  @override
  State<pinVerificationScreen> createState() =>  _pinVerificationScreen();
}


class _pinVerificationScreen extends State<pinVerificationScreen>{

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
                Text("A ^ digit pin has been send to your email address",style:Head6Text(colorLightGray)),
                SizedBox(height: 2,),
                PinCodeTextField(
                  appContext: context, 
                  length: 6,
                  pinTheme: AppOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v){

                  },
                  onChanged: (value){

                  },
                  ),
                  Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('verify'),
                        onPressed: (){

                        },
                      ),
                  ),
              ],
            ),
          ),
        ],
       ),
    );
  }
}