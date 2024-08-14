import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreen();
}

class _TaskCreateScreen extends State<TaskCreateScreen> {
  Map<String, String> Formvalues = {
    "title": "",
    "description": "",
    "status": "New"
  };
  bool Loading = false;

  InputOnChange(MapKey, TextValue) {}

  FormOnSubmit() async {
    if (Formvalues['title']!.length == 0) {
      ErrorToast("Email is Required");
    } else if (Formvalues['description']!.length == 0) {
      ErrorToast("description is Required");
    } else {
      setState(() {
        Loading = true;
      });
    }
    bool res = true;
    if (res == true) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    } else {
      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorOrange, // Set the AppBar background color here
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading
                ? (Center(child: CircularProgressIndicator()))
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create Your Task",
                            style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 1),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("title", Textvalue);
                          },
                          decoration: AppInputDecoration("Title"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("description", Textvalue);
                          },
                          decoration: AppInputDecoration("Description"),
                          maxLines: 12,
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Next'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )),
          )
        ],
      ),
    );
  }
}
