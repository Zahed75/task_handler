import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/style/style.dart';
import '../../style/style.dart';



class loginScreen extends StatefulWidget{
  @override
  State<loginScreen> createState() =>  _loginScreen();
}


class _loginScreen extends State<loginScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Stack(
          children: [
            ScreenBackground(context),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Started With BEL",style:Head1Text(colorDarkBlue)),
                  SizedBox(height: 1,),
                  Text("Track Task More fast",style:Head6Text(colorLightGray)),
                  SizedBox(height: 1,),
                  TextFormField(decoration: AppInputDecoration("Email Address"),),
                  SizedBox(height: 5,),
                  TextFormField(decoration: AppInputDecoration("Password"),),
                  SizedBox(height: 20,),
                  Container(
                    child:ElevatedButton(
                      style: AppButtonStyle(),
                      child:SuccessButtonChild('Login'),
                      onPressed: (){

                      },
                      ),),
                ],
              

              ),
            ),
          ],
        ),
        
    );
  }
}