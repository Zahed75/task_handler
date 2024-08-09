import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/style/style.dart';

class registrationScreen extends StatefulWidget {
  @override
  State<registrationScreen> createState() => _registrationScreen();
}

class _registrationScreen extends State<registrationScreen> {
  
  Map<String, String> FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "cpassword": ""
  };
  bool Loading = false;

  InputOnChange(String MapKey, String TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    print(FormValues); // Debugging: Print current FormValues
    if (FormValues['email']!.isEmpty) {
      ErrorToast("Email is required");
    } else if (FormValues['firstName']!.isEmpty) {
      ErrorToast("First Name is Required");
    } else if (FormValues['lastName']!.isEmpty) {
      ErrorToast("Last Name is Required");
    } else if (FormValues['mobile']!.isEmpty) {
      ErrorToast("Mobile No is Required");
    } else if (FormValues['password']!.isEmpty) {
      ErrorToast("Password is required");
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast("Confirm Password does not match");
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await RegistrationRequest(FormValues); // API call Registration
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false); // Next route
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Center( // Center all items
            child: SingleChildScrollView(
              child: Loading? Center(child: CircularProgressIndicator()): 
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center, // Center children horizontally
                        children: [
                          Text("Join With US", style: Head1Text(colorDarkBlue)),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("Email Address"),
                            onChanged: (value) => InputOnChange("email", value),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("First Name"),
                            onChanged: (value) => InputOnChange("firstName", value),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("Last Name"),
                            onChanged: (value) => InputOnChange("lastName", value),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: AppInputDecoration("Mobile"),
                            onChanged: (value) => InputOnChange("mobile", value),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: AppInputDecoration("Password"),
                            onChanged: (value) => InputOnChange("password", value),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: AppInputDecoration("Confirm Password"),
                            onChanged: (value) => InputOnChange("cpassword", value),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Registration'),
                              onPressed: () {
                                FormOnSubmit();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
