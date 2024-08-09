import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_handler/utility/utility.dart'; // Assuming your storage functions are here

class newTaskListScreen extends StatefulWidget {
  @override
  State<newTaskListScreen> createState() => _newTaskListScreen();
}

class _newTaskListScreen extends State<newTaskListScreen> {
  String email = "";

  @override
  void initState() {
    super.initState();
    CallUserData(); // Call the function here to load the user data
  }

  CallUserData() async {
    String? a = await ReadUserData("email");
    setState(() {
      email = a ?? "No Email Found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(email), // Display the email or fallback message
      ),
    );
  }
}
