import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_handler/style/style.dart';
import 'package:http/http.dart' as http;
import 'package:task_handler/utility/utility.dart';

var BaseURL = "https://task.teamrabbil.com/api/v1";

var RequestHeader = {"Content-Type": "application/json"};


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
  var URL=Uri.parse("${BaseURL}/registration");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:RequestHeader,body: PostBody);
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

Future<bool> VerifyEmailRequest(String email) async {
  var URL = Uri.parse("${BaseURL}/RecoverVerifyEmail/$email");

  try {
    var response = await http.get(URL, headers: RequestHeader);
    var ResultCode = response.statusCode;

    // Debugging prints
    print("Response Code: $ResultCode");
    print("Response Body: ${response.body}");

    if (ResultCode == 200) {
      var ResultBody = json.decode(response.body);
      if (ResultBody['status'] == "success") {
        await WriteEmailVerification(email);
        SuccessToast("Request Success");
        return true;
      } else {
        ErrorToast("Verification failed. Please check your email.");
        return false;
      }
    } else {
      ErrorToast("Request failed with status: $ResultCode");
      return false;
    }
  } catch (e) {
    // General error handling
    ErrorToast("Unexpected error occurred. Please try again.");
    print("Error: $e");
    return false;
  }
}



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

Future<bool> SetPasswordRequest(FormValues) async{

  var URL=Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody=json.encode(FormValues);

  var response= await  http.post(URL,headers:RequestHeader,body: PostBody);

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



// TaskStatus API Request


Future<List> TaskListRequest(Status) async {
  var URL=Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(URL,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> TaskCreateRequest(FormValues) async {

  var URL=Uri.parse("${BaseURL}/createTask");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};

  var PostBody=json.encode(FormValues);

  var response= await http.post(URL,headers:RequestHeaderWithToken,body: PostBody);
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
