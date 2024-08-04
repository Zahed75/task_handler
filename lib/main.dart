import 'package:flutter/material.dart';
import 'package:task_handler/screen/onboarding/splashScreen.dart';
import 'package:task_handler/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_handler/screen/onboarding/loginScreen.dart';
import 'package:task_handler/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_handler/screen/onboarding/registrationScreen.dart';
import 'package:task_handler/screen/onboarding/setPasswordScreen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
 
 @override

  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title:"Task Manager",
    initialRoute: '/registration',
      routes:{
        // '/':(conext)=>SplashScreen(),
       
        '/login':(conext)=>loginScreen(),
        '/registration':(conext)=>registrationScreen(),
        '/emailVerification':(conext)=>emailVerificationScreen(),
        '/pinVerification':(conext)=>pinVerificationScreen(),
        '/setPassword':(conext)=>setPasswordScreen(),

      },
    );
  }
}