import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';
import 'package:task_handler/utility/utility.dart';

AppBar TaskAppBar(context,ProfileData) {
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
                child: Image.memory(ShowBase64Image(ProfileData['photo']))),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ProfileData['firstName'],style: Head6Text(colorWhite),),
              Text(ProfileData['email'],style: Head9Text(colorWhite),)
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: (){

      }, 
      icon: Icon(Icons.add_circle_outline,color:Colors.white),   
      ),
      IconButton(onPressed: ()async{
          await RemoveToken();
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false);
      }, 
      icon: Icon(Icons.output,color: Colors.white,)
      )
    ],
  );
}
