import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


String defaultProfilePic = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Fvector-art%2F4819327-male-avatar-profile-icon-of-smiling-caucasian-man&psig=AOvVaw0stc7idrDbPL_0-eOz6uwq&ust=1723705241520000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMD3w8n084cDFQAAAAAdAAAAABAJ";

// Store user data temporarily
Future<void> WriteUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName', UserData['data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
}


// Email Store

Future<void> WriteEmailVerification(Email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', Email);
}

// OTP Store

Future<void> WriteOTPVerification(OTP) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', OTP);
}

// Read user data
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = await prefs.getString(Key);
  return mydata;
}


// Base64 image convert

ShowBase64Image(Base64String){
 UriData? data= Uri.parse(Base64String).data;
 Uint8List MyImage= data!.contentAsBytes();
 return MyImage;
}



Future<bool>RemoveToken() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  return true;
}