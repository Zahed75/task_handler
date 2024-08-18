import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/taskList.dart';
import 'package:task_handler/screen/onboarding/splashScreen.dart';
import 'package:task_handler/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_handler/screen/onboarding/loginScreen.dart';
import 'package:task_handler/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_handler/screen/onboarding/registrationScreen.dart';
import 'package:task_handler/screen/onboarding/setPasswordScreen.dart';
import 'package:task_handler/screen/task/homeScreen.dart';
import 'package:task_handler/component/newTaskList.dart';
import 'package:task_handler/screen/task/taskCreateScreen.dart';
import 'package:task_handler/utility/utility.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
String? token = await ReadUserData('token');
if(token==null){
  runApp(MyApp("/login"));// if token available
}else{
  runApp(MyApp("/newTaskList"));
}
  
}



class MyApp extends StatelessWidget{
  final String FirstRoute;

MyApp(this.FirstRoute);
 
 @override

  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title:"Task Manager",
    initialRoute: '/',
      routes:{
        '/':(conext)=>SplashScreen(),
        '/home':(context)=>homeScreen(),
        '/login':(conext)=>loginScreen(),
        '/registration':(conext)=>registrationScreen(),
        '/emailVerification':(conext)=>emailVerificationScreen(),
        '/pinVerification':(conext)=>pinVerificationScreen(),
        '/setPassword':(conext)=>setPasswordScreen(),
        '/taskCreate': (context) => taskCreateScreen(), // Corrected to return a widget
        '/newTaskList': (context) => newTaskList(), // Ensure this is defined correctly

      },
    );
  }
}