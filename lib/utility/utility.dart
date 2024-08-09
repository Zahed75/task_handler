import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';


// Store user data temporarily
Future<void> WriteUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName',UserData['data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
}




// Email Store

Future<void> WriteEmailVerification(Email)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification',Email);
}


// OTP Store

Future<void> WriteOTPVerification(OTP)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', OTP);
}


// Read user data
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(Key);
  return mydata;
}