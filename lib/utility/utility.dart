import 'dart:typed_data';
import 'dart:convert'; // For base64 decoding// For Uint8List
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



// String defaultProfilePic="https://drive.google.com/file/d/1iA534h7YVE_a8R7aaJqM762t5fbwZQCV/view?usp=drive_link";


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
    // Check if the string is missing the data URI prefix
    if (!base64String.startsWith('data:')) {
      base64String = 'data:image/png;base64,' + base64String;
    }

    UriData? data = Uri.parse(base64String).data;
    if (data == null) {
      print("Error: The provided string is not a valid data URI.");
      return null; // Return null or a placeholder image
    }
    return data.contentAsBytes();
  } catch (e) {
    print("Exception occurred: $e");
    return null; // Return null or a placeholder image
  }
}




Future<bool>RemoveToken() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}