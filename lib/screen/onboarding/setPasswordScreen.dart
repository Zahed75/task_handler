import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/style/style.dart';




class setPasswordScreen extends StatefulWidget{
  @override
  State<setPasswordScreen> createState() =>  _setPasswordScreen();
}


class _setPasswordScreen extends State<setPasswordScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding:EdgeInsets.all(30),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Set Password",style: Head1Text(colorDarkBlue),),
                SizedBox(height: 2,),
                Text("Minimum length password 8 characters with letter and number combinations",style:Head6Text(colorLightGray)),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                SizedBox(height: 3,),
                Container(
                  child: ElevatedButton(
                    style:AppButtonStyle(),
                    child:SuccessButtonChild('Confirm'),
                    onPressed: (){
                      
                    },
                    ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}