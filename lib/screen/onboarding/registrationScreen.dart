import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/style/style.dart';




class registrationScreen extends StatefulWidget{
  @override
  State<registrationScreen> createState() =>  _registrationScreen();
}


class _registrationScreen extends State<registrationScreen>{

  Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","photo":"","cpassword":""};
  bool Loading = false;

  InputOnChange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey,(value)=>Textvalue);
    });
  }

FormOnSubmit()async{
  if(FormValues['email']!.length==0){
    ErrorToast("Email is required");
  }
  else if(FormValues['firstName']!.length==0){
    ErrorToast("First Name is Required");
  }
  else if(FormValues['lastName']!.length==0){
    ErrorToast("Last Name is Required");
  }
  else if(FormValues['mobile']!.length==0){
    ErrorToast("Mobile No is Required");
  }
  else if(FormValues['password']!.length==0){
    ErrorToast("Password is required");
  }
  else if(FormValues['password']!=FormValues['cpassword']){
    ErrorToast("Confirm Passwrod is required");
  }
  else{
    setState(() {Loading =true;});
    bool res = await RegistrationRequest(FormValues); // api call Registration
    if(res==true){
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false); // next route
    }
    else{
      setState(() {Loading = false;});
    }
  }

}


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