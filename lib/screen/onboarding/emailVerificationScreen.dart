import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/style/style.dart';




class emailVerificationScreen extends StatefulWidget{
  @override
  State<emailVerificationScreen> createState() =>  _emailVerificationScreen();
}


class _emailVerificationScreen extends State<emailVerificationScreen>{

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
                 Text('Your Email Address',style:Head1Text(colorDarkBlue)),
                 SizedBox(height: 1,),
                 Text('A 6digit verification PIN will be send to your email address',style: Head6Text(colorLightGray),),
                 SizedBox(height: 1,),
                 TextFormField(decoration: AppInputDecoration("Email Address"),),
                 SizedBox(height: 10,),
                 Container(
                    child:ElevatedButton(
                      style: AppButtonStyle(),
                      child:SuccessButtonChild('Next'),
                      onPressed: (){

                      },
                      ),
                ),
                ],
              )
            ),
          ],
        ),
    );
  }
}