import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';
import 'package:task_handler/utility/utility.dart';



AppBar TaskAppBar(BuildContext context, Map<String, dynamic> ProfileData) {
  return AppBar(
    backgroundColor: colorOrange,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(8, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: ProfileData['photo'] != null
                  ? Image.memory(ShowBase64Image(ProfileData['photo']) ?? Uint8List(0))
                  : Icon(Icons.person, size: 48, color: Colors.grey), // Placeholder icon if photo is null
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ProfileData['firstName'] ?? 'Unknown',
                style: Head6Text(colorWhite),
              ),
              Text(
                ProfileData['email'] ?? 'No Email',
                style: Head9Text(colorWhite),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/taskCreate");
        },
        icon: Icon(Icons.add_circle_outline, color: Colors.white),
      ),
      IconButton(
        onPressed: () async {
          await RemoveToken();
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
        },
        icon: Icon(Icons.output, color: Colors.white),
      ),
    ],
  );
}
