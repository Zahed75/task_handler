import 'dart:convert';
import 'package:task_handler/style/style.dart';
import 'package:http/http.dart' as http;
import 'package:task_handler/utility/utility.dart';

var BaseURL = "https://task.teamrabbil.com/api/v1";

var RequestHeader={"Content-Type":"application/json"};





Future<bool> LoginRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}





Future<bool> RegistrationRequest(FormValues) async{

  var URL = Uri.parse("${BaseURL}/registration");
  var PostBody = json.encode(FormValues);
  var response = await http.post(URL,headers:RequestHeader,body:PostBody);
  var ResultCode=response.statusCode;

  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");

    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


Future<bool> VerifyEmailRequest(Email) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");
  var response= await http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await WriteEmailVerification(Email);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}





// Email OTP Verfication
Future<bool> VerifyOTPRequest(Email,OTP) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
  var response= await  http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await WriteOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}





// setPassword

Future<bool> SetPasswordRequest(FormValues) async {
  var URL = Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL,headers: RequestHeader,body:PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode ==200 && ResultBody['status']=="sucess"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Failed");
    return false;
  }

}