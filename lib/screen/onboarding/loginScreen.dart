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
  Map<String, String> formValues = {"email": "", "password": ""};
  bool loading = false;

  void inputOnChange(String mapKey, String textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  Future<void> formOnSubmit() async {
    if (formValues['email']!.isEmpty) {
      ErrorToast("Email is required");
      return;
    } else if (formValues['password']!.isEmpty) {
      ErrorToast("Password is required");
      return;
    }

    setState(() {
      loading = true; // Show loading indicator
    });

    bool res = await LoginRequest(formValues);
    setState(() {
      loading = false; // Hide loading indicator
    });

    if (res) {
      Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: loading? Center(child: CircularProgressIndicator()): SingleChildScrollView(
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
                          onChanged: (textValue) {
                            inputOnChange("email", textValue);
                          },
                          decoration: AppInputDecoration("Email Address"),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          obscureText: true, // Hide password text
                          onChanged: (textValue) {
                            inputOnChange("password", textValue);
                          },
                          decoration: AppInputDecoration("Password"),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Login'),
                            onPressed: () {
                              formOnSubmit();
                            },
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          alignment: Alignment.center,
                           child:Column(
                            children: [
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context,"/emailVerification");
                                },
                                child:Text("ForgetPassword",style:Head7Text(colorLightGray))
                              )
                            ],
                           )
                        ),
                        SizedBox(height: 3,),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, "/registration");
                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't Have an Account? ",style:Head7Text(colorDarkBlue)),
                                    Text("SignUp",style: Head7Text(colorGreen),)
                                  ],
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
