import 'dart:typed_data';
import 'dart:convert'; // For base64 decoding// For Uint8List
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


// Convert Base64 string to Uint8List

Uint8List? ShowBase64Image(String base64String) {
  try {
    // Remove any Base64 data URL prefix (e.g., "data:image/png;base64,") if present
    final base64Image = base64String.split(',').last;
    return base64Decode(base64Image);
  } catch (e) {
    print("Error decoding base64 image: $e");
    return null;
  }
}


Future<bool>RemoveToken() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}