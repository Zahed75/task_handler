import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/style/style.dart';
import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreen();
}

class _loginScreen extends State<loginScreen> {
  // API Calling
  Map<String, String> FormValues = {"email": "", "password": ""};

  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast("Email is required");
    } else if (FormValues['password']!.length == 0) {
      ErrorToast("Password is required");
    } else {
      setState(() {
        Loading = true; // will be true

      });
      bool res = await LoginRequest(FormValues);
      if (res == true) {
        // Navigate to Dashboard Page
       Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route)=> false);

      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  /// API Calling END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading? (Center(child: CircularProgressIndicator())): (SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get Started With BEL", style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 1),
                        Text("Track Task More fast", style: Head6Text(colorLightGray)),
                        SizedBox(height: 1),
                        TextFormField(
                          onChanged: (TextValue) {
                            InputOnChange("email", TextValue);
                          },
                          decoration: AppInputDecoration("Email Address"),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          onChanged: (TextValue) {
                            InputOnChange("password", TextValue);
                          },
                          decoration: AppInputDecoration("Password"),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Login'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
