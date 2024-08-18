import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';
import 'package:task_handler/utility/utility.dart';

AppBar TaskAppBar(BuildContext context, Map<String, String> profileData) {
  // Get the Base64 image string
  String? photoBase64 = profileData['photo'];

  // Convert Base64 to Uint8List
  Uint8List? imageBytes = ShowBase64Image(photoBase64 ?? '');

  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: imageBytes != null
                  ? Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person, size: 48, color: Colors.grey);
                      },
                    )
                  : Icon(Icons.person, size: 48, color: Colors.grey),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profileData['firstName']} ${profileData['lastName']}',
                style: Head7Text(colorWhite),
              ),
              Text(
                profileData['email'] ?? '',
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
        icon: Icon(Icons.add_circle_outline),
      ),
      IconButton(
        onPressed: () async {
          await RemoveToken();
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
        },
        icon: Icon(Icons.output),
      ),
    ],
  );
}
